package pl.coderslab.charity.donation;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.institution.Institution;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = Donation.TABLE)
public class Donation {
    public final static String TABLE = "donation";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer quantity;
    private String street;
    private String city;
    private String zipCode;
    private LocalTime pickUpTime;
    private String pickUpComment;
    private LocalDate pickUpDate;

    @ManyToMany
    private List<Category> categories;

    public Donation() {
        categories = new ArrayList<>();
    }

    @ManyToOne
    private Institution institution;
}
