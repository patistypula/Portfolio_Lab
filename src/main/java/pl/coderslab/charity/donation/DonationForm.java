package pl.coderslab.charity.donation;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DonationForm extends Donation{
    protected int step;
    protected int direct;
}
