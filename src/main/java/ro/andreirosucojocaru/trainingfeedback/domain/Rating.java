package ro.andreirosucojocaru.trainingfeedback.domain;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Entity
public @Data class Rating implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "schedule_id")
    private Schedule schedule;

    @ManyToOne
    @JoinColumn(name = "trainer_id")
    private Employee trainer;

    @ManyToOne
    @JoinColumn(name = "trainee_id")
    private Employee trainee;

    @Column(nullable = false)
    private Integer grade;

    @Column
    private String remark;

}
