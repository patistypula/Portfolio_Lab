package pl.coderslab.charity.donation;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@Component
@SessionScope
@Getter
@Setter
@NoArgsConstructor
public class DonationFormStep2 {
    protected Integer quantity;
}
