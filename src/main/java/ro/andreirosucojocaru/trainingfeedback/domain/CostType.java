package ro.andreirosucojocaru.trainingfeedback.domain;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public @Data class CostType implements Serializable {

    public final static String PER_EMPLOYEE = "per_employee";
    public final static String PER_CLASS = "per_class";

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column
    private String description;
}
