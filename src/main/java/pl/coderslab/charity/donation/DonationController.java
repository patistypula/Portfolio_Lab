package pl.coderslab.charity.donation;

import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.category.CategoryService;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionService;
import pl.coderslab.charity.user.CurrentUser;
import pl.coderslab.charity.user.User;


import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/form")
public class DonationController {
    private final DonationService donationService;
    private final CategoryService categoryService;
    private final InstitutionService institutionService;

    private DonationFormStep1 step1;
    private DonationFormStep2 step2;
    private DonationFormStep3 step3;
    private DonationFormStep4 step4;

    @ModelAttribute("categories")
    public List<Category> getAllCategory() {
        return categoryService.getAllCategory();
    }

    @ModelAttribute("institutions")
    public List<Institution> getAllInstitution() {
        return institutionService.getAllInstitution();
    }

    @GetMapping("")
    public String addDonation(Model model, HttpSession session){
        model.addAttribute("step1", step1);
        return "form";
    }

    @PostMapping(params = "previousStep1")
    public String addDonationPrevious(Model model, HttpSession session){
        setCategory();
        model.addAttribute("step1", step1);
        return "form";
    }

    @PostMapping(params = "toStep2")
    public String addDonationNext(@ModelAttribute("step1") DonationFormStep1 step,
                                  Model model, HttpSession session){
        step1 = step;
        if(step2!=null){
            List<Category> categories = categoryService.getAllCategory();
            List<Category> result = new ArrayList<>();
            for(Category category : categories){
                for(int i=0;   i<step1.getCategories().size();   i++){
                    if(step1.getCategories().get(i).getId()==category.getId()){
                        result.add(category);
                        break;
                    }
                }
            }
            step1.setCategories(result);
        }
        model.addAttribute("step2", step2);
        return "form2";
    }
    @PostMapping(params = "previousStep2")
    public String addDonationPrevious2(Model model, HttpSession session){
        model.addAttribute("step2", step2);
        return "form2";
    }

    @PostMapping(params = "toStep3")
    public String addDonationNext(@ModelAttribute("step2") DonationFormStep2 step,
                                  Model model, HttpSession session){
        step2 = step;
        model.addAttribute("step3", step3);
        return "form3";
    }

    @PostMapping(params = "previousStep3")
    public String addDonationPrevious3(Model model, HttpSession session){
        model.addAttribute("step3", step3);
        return "form3";
    }

    @PostMapping(params = "toStep4")
    public String addDonationNext(@ModelAttribute("step3") DonationFormStep3 step,
                                  Model model, HttpSession session){
        step3 = step;
        if(step3.getInstitution()!=null) {
            step3.setInstitution(institutionService.getById(step3.getInstitution().getId()));
        }
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        LocalDate data = LocalDate.parse(, formatter);
//        step4.setPickUpDate(data);
        model.addAttribute("step", step4);
        return "form4";
    }

    @PostMapping(params = "previousStep4")
    public String addDonationPrevious4(Model model, HttpSession session){
        model.addAttribute("step", step4);
        return "form4";
    }

    @PostMapping(params = "toStep5")
    public String addDonationNext(@ModelAttribute("step") DonationFormStep4 step,
                                  Model model, HttpSession session){
        model.addAttribute("step1", step1);
        model.addAttribute("step2", step2);
        model.addAttribute("step3", step3);
        model.addAttribute("step4", step4);
        return "formResult";
    }

    @PostMapping(params = "save")
    public String addDonationNext(HttpSession session, WebRequest request,
                                  SessionStatus status){
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
        return "redirect:/form";
    }

    private void setCategory(){
        List<Category> categories = categoryService.getAllCategory();
        List <Category> donatCategory = new ArrayList<>();
        if(step1.getCategories().size()>0) {
            for (Category category : categories) {
                for (int i = 0; i < step1.getCategories().size(); i++) {
                    if (category.getId() == step1.getCategories().get(i).getId()) {
                        donatCategory.add(category);
                    }
                }
            }
        }
        step1.setCategories(donatCategory);
    }

    @ModelAttribute("currentUser")
    public String name(@AuthenticationPrincipal CurrentUser currentUser){
        User entityUser = currentUser.getUser();
        return entityUser.getUsername();
    }
}