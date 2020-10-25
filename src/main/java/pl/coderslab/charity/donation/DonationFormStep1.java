package pl.coderslab.charity.donation;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;
import pl.coderslab.charity.category.Category;

import java.util.ArrayList;
import java.util.List;

@Component
@SessionScope
@Getter
@Setter
@NoArgsConstructor
public class DonationFormStep1 {
    protected List<Category> categories = new ArrayList<>();
}
