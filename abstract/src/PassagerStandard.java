package tec;

public class PassagerStandard extends Passager implements Usager {
    //de meme..///

    private String nom;
    private int destination;
    private Position maPosition;

    public PassagerStandard(String nom, int destination) {
        this.nom = nom;
        this.destination = destination;
        this.maPosition = Position.dehors();
    }

    String nom() {
        return nom;
    }

    boolean estDehors() {
        return maPosition.estDehors();
    }

    boolean estAssis() {
        return maPosition.estAssis();
    }

    boolean estDebout() {
        return maPosition.estDebout();
    }

    void changerEnDehors() {
        maPosition = Position.dehors();
    }

    void changerEnAssis() {
        maPosition = Position.assis();
    }

    void changerEnDebout() {
        maPosition = Position.debout();
    }

    public void monterDans(Transport t) {
	Vehicule v=(Vehicule)t;
        if (v.aPlaceAssise()) {
            v.monteeDemanderAssis(this);
        } else if (v.aPlaceDebout()) {
            v.monteeDemanderDebout(this);
        }
    }

    void nouvelArret(Vehicule v, int numeroArret) {
        if (numeroArret == destination)
            v.arretDemanderSortie(this);
    }

    public String toString() {
        return nom + " " + maPosition;
    }
}
