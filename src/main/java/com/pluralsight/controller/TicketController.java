package com.pluralsight.controller;

import com.pluralsight.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class TicketController {

    @Autowired
    private TicketService ticketService;

    @Autowired
    public void setTicketService(TicketService ticketService) { this.ticketService = ticketService; }

    @GetMapping("/tickets")
    public String retrieveTickets(Model model){
        model.addAttribute("tickets", ticketService.listTickets());
        return "tickets";
    }

}
