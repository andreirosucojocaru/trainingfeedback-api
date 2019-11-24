package ro.andreirosucojocaru.trainingfeedback.domain;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public @Data class Position implements Serializable {

    public final static String TRAINER = "trainer";
    public final static String TRAINEE = "trainee";

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false)
    private String name;

}
