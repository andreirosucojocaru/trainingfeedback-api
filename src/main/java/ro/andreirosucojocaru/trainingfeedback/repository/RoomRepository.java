package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Room;

import javax.transaction.Transactional;

@Transactional
public interface RoomRepository extends CrudRepository<Room, Long> {
}
