#include <SFML/Window.hpp>
#include <SFML/Graphics.hpp>


class Button {
public:
    Button(std::string, sf::Vector2f location);
    sf::RectangleShape getShape();
private:
    sf::String String;
    sf::RectangleShape shape;
};

Button::Button(std::string, sf::Vector2f location) {
    shape.setPosition(location);
    shape.setFillColor(sf::Color(100, 200, 50));
}
sf::RectangleShape Button::getShape() { return shape; }

int main()
{
    sf::RenderWindow window(sf::VideoMode(1200, 1000), "My window");
    Button button1("Test", { 100,50 });
    while (window.isOpen())
    {
        window.draw(button1.getShape());




        //INTERACTIONS UTILISATEURS
        sf::Event event;
        while (window.pollEvent(event))
        {
            // évènement "fermeture demandée" : on ferme la fenêtre
            if (event.type == sf::Event::Closed)
                window.close();
        }
    }

    return 0;
}