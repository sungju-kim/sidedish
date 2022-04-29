package codesquad.sidedish.web.dto;

import codesquad.sidedish.domain.order.Order;
import lombok.Getter;

@Getter
public class OrderCreateResponse {

    private Long orderId;
    private String orderMemberName;
    private String deliveryAddress;
    private String orderItemName;
    private int originalItemPrice;
    private int discountedItemPrice;
    private int orderItemCount;
    private String discountPolicy;
    private String deliveryType;
    private int deliveryFee;
    private int totalPrice;
    private int mileage;

    public OrderCreateResponse(Order order) {
        this.orderId = order.getOrderId();
        this.orderMemberName = order.getMember().getMemberName();
        this.deliveryAddress = order.getDelivery().getAddress().fullname();
        this.orderItemName = order.getItem().getName();
        this.originalItemPrice = order.getOrderItemPrice();
        this.discountedItemPrice = order.getDiscountedItemPrice();
        this.orderItemCount = order.getItemCount();
        this.discountPolicy = order.getDiscountPolicy().getName();
        this.deliveryType = order.getDelivery().getDeliveryType().name();
        this.deliveryFee = order.getDelivery().getDeliveryFee();
        this.totalPrice = order.getTotalPrice();
        this.mileage = order.getOrderMileage();
    }

}
