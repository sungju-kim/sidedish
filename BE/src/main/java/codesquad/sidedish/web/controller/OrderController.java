package codesquad.sidedish.web.controller;

import codesquad.sidedish.domain.member.Member;
import codesquad.sidedish.domain.member.MemberRepository;
import codesquad.sidedish.service.OrderService;
import codesquad.sidedish.web.dto.OrderCreateRequest;
import codesquad.sidedish.web.dto.OrderCreateResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrderController {
    public static final long DEFAULT_MEMBER_ID = 1L;
    private final MemberRepository memberRepository;
    private final OrderService orderService;

    @PostMapping
    public OrderCreateResponse orderCreate(@RequestBody OrderCreateRequest createRequest) {
        Member defaultMember = memberRepository.findById(DEFAULT_MEMBER_ID).get();
        return orderService.createOrder(defaultMember, createRequest);
    }
}
