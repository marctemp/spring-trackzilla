package com.pluralsight.controller;

import com.pluralsight.entity.Application;
import com.pluralsight.service.ApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/applications")
public class ApplicationController {

    @Autowired
    private ApplicationService applicationService;

    @Autowired
    public void setApplicationService(ApplicationService applicationService) {
        this.applicationService = applicationService;
    }

    /* MVC @Controller way


    @GetMapping("/applications")
    public String retrieveApplications(Model model){
        model.addAttribute("applications", applicationService.listApplications());
        return "applications";
    }

     */

    @GetMapping
    public ResponseEntity<Iterable<Application>> retrieveApplications() {
        Iterable<Application> applications = applicationService.listApplications();
        return new ResponseEntity<Iterable<Application>>(applications, HttpStatus.OK);
    }

    @GetMapping
    @RequestMapping("{id}")
    public ResponseEntity<Application> retrieveSingleApplication(@PathVariable Integer id) {
        Application application = applicationService.listSingleApplication(id);
        return new ResponseEntity<>(application, HttpStatus.OK);
    }
}
