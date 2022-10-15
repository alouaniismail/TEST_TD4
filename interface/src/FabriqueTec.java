package tec;
public final class FabriqueTec //non héritable avec le mot cle final.
{
	private FabriqueTec() //non instanciable cette classe même si par défaut le private bloque tout.
	{
	}
    public static Usager fairePassagerStandard(String nom, int dst)
    {
	return new PassagerStandard(nom,dst);
    }

    public static Transport faireAutobus(int nbr_1, int nbr2)
    {
	return new Autobus(nbr_1,nbr2);
    }
}
//n'est pas instanciee ca sert a rien:ces methodes sont en static
//ni servir de classe de base:ne contient aucune autre methode de
//modification, d'instanciation ou un constructeur particulier(
//3ieme point important revient a l'instanciation a 99%).
