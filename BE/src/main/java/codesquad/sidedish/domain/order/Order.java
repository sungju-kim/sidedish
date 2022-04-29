package codesquad.sidedish.domain.order;

import codesquad.sidedish.domain.delivery.Delivery;
import codesquad.sidedish.domain.discount.DiscountPolicy;
import codesquad.sidedish.domain.item.Item;
import codesquad.sidedish.domain.member.Member;
import codesquad.sidedish.domain.mileage.MileagePolicy;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@EqualsAndHashCode
@ToString
public class Order {
    private Long orderId;
    private Item item;
    private Member member;
    private Delivery delivery;
    private DiscountPolicy discountPolicy;
    private int orderItemPrice;
    private int itemCount;

    public Order(Item item, Member member, Delivery delivery, DiscountPolicy discountPolicy, int orderItemPrice, int itemCount) {
        this.item = item;
        this.member = member;
        this.delivery = delivery;
        this.discountPolicy = discountPolicy;
        this.orderItemPrice = orderItemPrice;
        this.itemCount = itemCount;
    }

    @Builder
    public Order(Long orderId, Item item, Member member, Delivery delivery, DiscountPolicy discountPolicy, int orderItemPrice, int itemCount) {
        this.orderId = orderId;
        this.item = item;
        this.member = member;
        this.delivery = delivery;
        this.discountPolicy = discountPolicy;
        this.orderItemPrice = orderItemPrice;
        this.itemCount = itemCount;
    }

    public void initOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public int getTotalPrice() {
        int totalItemPrice = getTotalItemPrice();
        int deliveryFee = delivery.getDeliveryFee();
        return totalItemPrice + deliveryFee;
    }

    private int getTotalItemPrice() {
        return getDiscountedItemPrice() * itemCount;
    }

    public int getDiscountedItemPrice() {
        return discountPolicy.calculateDiscountedPrice(orderItemPrice);
    }

    public int getOrderMileage() {
        return (int)(getTotalItemPrice() * MileagePolicy.MILEAGE_RATE);
    }
}


