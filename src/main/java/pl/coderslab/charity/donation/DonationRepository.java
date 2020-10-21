package pl.coderslab.charity.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public interface DonationRepository extends JpaRepository<Donation, Long> {
    @Query("select sum(d.quantity) from Donation d")
    Integer countDonationByQuantity();

    @Query("select count(d.id) from Donation d")
    Long countAllDonation();

}
