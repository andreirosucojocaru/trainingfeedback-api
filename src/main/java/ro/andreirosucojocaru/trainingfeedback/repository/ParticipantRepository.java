package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Participant;

import javax.transaction.Transactional;

@Transactional
public interface ParticipantRepository extends CrudRepository<Participant, Long> {
}
