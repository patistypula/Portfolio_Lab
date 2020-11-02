package pl.coderslab.charity.donation;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.category.CategoryService;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/form")
public class DonationController {
    private final DonationService donationService;
    private final CategoryService categoryService;
    private final InstitutionService institutionService;

    public DonationController(DonationService donationService, CategoryService categoryService, InstitutionService institutionService) {
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
    }

    @ModelAttribute("categories")
    public List<Category> getAllCategory() {
        return categoryService.getAllCategory();
    }

    @ModelAttribute("institutions")
    public List<Institution> getAllInstitution(){
        return institutionService.getAllInstitution();
    }


    @GetMapping("")
    public String addDonation(Model model){
        DonationFormStep1 step1 = new DonationFormStep1();
        model.addAttribute("step1", step1);
        model.addAttribute("step", 1);
        return "form";
    }

    @PostMapping(params = "toStep2")
    public String addDonationNext(@ModelAttribute("step1") DonationFormStep1 step1,
                                  Model model, HttpSession session){
        session.setAttribute("step1", step1);
        DonationFormStep2 step2 = new DonationFormStep2();
        model.addAttribute("step2", step2);
        model.addAttribute("step",2);
        return "form";
    }

    @PostMapping(params = "toStep3")
    public String addDonationNext(@ModelAttribute("step2") DonationFormStep2 step2,
                                  Model model, HttpSession session){
        model.addAttribute("step", 3);
        DonationFormStep3 step3 = new DonationFormStep3();
        session.setAttribute("step2", step2);
        model.addAttribute("step3", step3);
        return "form";
    }

    @PostMapping(params = "toStep4")
    public String addDonationNext(@ModelAttribute("step3") DonationFormStep3 step3,
                                  Model model, HttpSession session){
        DonationFormStep4 step4 = new DonationFormStep4();
        session.setAttribute("step3", step3);
        model.addAttribute("step4", step4);
        model.addAttribute("step", 4);
        return "form";
    }

    @PostMapping(params = "toStep5")
    public String addDonationNext(@ModelAttribute("step4") DonationFormStep4 step4,
                                  Model model, HttpSession session){
        DonationFormStep1 step1 = (DonationFormStep1) session.getAttribute("step1");
        DonationFormStep2 step2 = (DonationFormStep2) session.getAttribute("step2");
        DonationFormStep3 step3 = (DonationFormStep3) session.getAttribute("step3");
        session.setAttribute("step4", step4);
        model.addAttribute("step1", step1);
        model.addAttribute("step2", step2);
        model.addAttribute("step3", step3);
        model.addAttribute("step4", step4);
        model.addAttribute("step", 5);
        return "form";
    }

    @PostMapping(params = "save")
    public String addDonationNext(HttpSession session, WebRequest request,
                                  SessionStatus status){
        DonationFormStep1 step1 = (DonationFormStep1) session.getAttribute("step1");
        DonationFormStep2 step2 = (DonationFormStep2) session.getAttribute("step2");
        DonationFormStep3 step3 = (DonationFormStep3) session.getAttribute("step3");
        DonationFormStep4 step4 = (DonationFormStep4) session.getAttribute("step4");

        Donation donation = new Donation();
        donation.setCategories(step1.getCategories());
        donation.setQuantity(step2.getQuantity());
        donation.setInstitution(step3.getInstitution());
        donation.setStreet(step4.getStreet());
        donation.setCity(step4.getCity());
        donation.setZipCode(step4.getZipCode());
        donation.setPickUpDate(step4.getPickUpDate());
        donation.setPickUpTime(step4.getPickUpTime());
        donation.setPickUpComment(step4.getPickUpComment());
        donationService.saveNewDonation(donation);
        request.removeAttribute("step1", WebRequest.SCOPE_SESSION);
        request.removeAttribute("step2", WebRequest.SCOPE_SESSION);
        request.removeAttribute("step3", WebRequest.SCOPE_SESSION);
        request.removeAttribute("step4", WebRequest.SCOPE_SESSION);
        return "index";
    }
}
