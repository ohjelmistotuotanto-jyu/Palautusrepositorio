from entities.user import User


class UserInputError(Exception):
    pass


class AuthenticationError(Exception):
    pass


class UserService:
    def __init__(self, user_repository):
        self._user_repository = user_repository

    def check_credentials(self, username, password):
        if not username or not password:
            raise UserInputError("Username and password are required")

        user = self._user_repository.find_by_username(username)

        if not user or user.password != password:
            raise AuthenticationError("Invalid username or password")

        return user

    def create_user(self, username, password):
        self.validate(username, password)

        user = self._user_repository.create(
            User(username, password)
        )

        return user

    def validate(self, username, password):
        # Ei löydy
        if not username or not password:
            raise UserInputError("Username and password are required")

        # Käyttäjätunnuksen pituus
        if len(username) < 3:
            raise UserInputError("Username is too short")

        # Vain sallittuja merkkejä
        if not username.isalnum():
            raise UserInputError("Invalid username")

        # Salasanan pituus
        if len(password) < 8:
            raise UserInputError("Password is too short")

        # Salasana vaatii muitakin merkkejä
        if password.isalpha():
            raise UserInputError("Password must contain numbers or special characters")