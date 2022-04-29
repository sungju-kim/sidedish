package codesquad.sidedish.service;

import codesquad.sidedish.domain.address.Address;
import codesquad.sidedish.domain.delivery.Delivery;
import codesquad.sidedish.domain.delivery.DeliveryRepository;
import codesquad.sidedish.domain.delivery.DeliveryType;
import codesquad.sidedish.domain.item.Item;
import codesquad.sidedish.domain.item.ItemRepository;
import codesquad.sidedish.domain.member.Member;
import codesquad.sidedish.domain.member.MemberRepository;
import codesquad.sidedish.domain.order.Order;
import codesquad.sidedish.domain.order.OrderRepository;
import codesquad.sidedish.exception.ItemNotFoundException;
import codesquad.sidedish.web.dto.OrderCreateRequest;
import codesquad.sidedish.web.dto.OrderCreateResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    private final ItemRepository itemRepository;
    private final DeliveryRepository deliveryRepository;
    private final MemberRepository memberRepository;

    @Transactional
    public OrderCreateResponse createOrder(Member orderMember, OrderCreateRequest createRequest) {
        Long orderItemId = createRequest.getItemId();
        int orderCount = createRequest.getCount();
        Item orderItem = itemRepository.findById(orderItemId)
                .orElseThrow(() -> new ItemNotFoundException("주문하려는 상품이 존재하지 않습니다."));

        Address orderAddress = orderMember.getAddress();
        DeliveryType deliveryType = determineDeliveryType(orderAddress, orderItem);
        int totalOrderPrice = orderItem.calculateTotalPrice(orderCount);
        Delivery delivery = new Delivery(totalOrderPrice, deliveryType, orderAddress);
        deliveryRepository.save(delivery);

        orderMember.earnMileage(orderItem.calculateTotalMileage(orderCount));
        orderItem.reduceStock(orderCount);
        itemRepository.updateStock(orderItem);
        memberRepository.update(orderMember);

        Order order = Order.builder()
                .item(orderItem)
                .member(orderMember)
                .delivery(delivery)
                .discountPolicy(orderItem.getDiscountPolicy())
                .orderItemPrice(orderItem.getPrice())
                .itemCount(orderCount)
                .build();
        orderRepository.save(order);
        return new OrderCreateResponse(order);
    }

    private DeliveryType determineDeliveryType(Address address, Item orderItem) {
        return isDawnDeliveryAvailable(address, orderItem)
                ? DeliveryType.DAWN
                : DeliveryType.GENERAL;
    }

    private boolean isDawnDeliveryAvailable(Address address, Item orderItem) {
        return orderItem.isSupportDawnDelivery() && (address.getDistrict().equals("서울특별시") || address.getDistrict().equals("경기도"));
    }
}
