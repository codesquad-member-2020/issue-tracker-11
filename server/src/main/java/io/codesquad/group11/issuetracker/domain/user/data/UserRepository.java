package io.codesquad.group11.issuetracker.domain.user.data;

import io.codesquad.group11.issuetracker.domain.user.domain.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {

    boolean existsByGithubId(Long githubId);

}
