package pl.coderslab.charity.donation;

import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class DonationService {
    private final DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public Integer countDonationByQuantity(){
        return donationRepository.countDonationByQuantity();
    }

    public Long countAllDonation(){
        return donationRepository.countAllDonation();
    }

    public Donation saveNewDonation(Donation donation) {
        return donationRepository.save(donation);
    }
}
