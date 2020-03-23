/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.afpa.villagegreen;

import java.net.URL;
import java.util.ResourceBundle;
import java.util.regex.Pattern;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;

/**
 * FXML Controller class
 *
 * @author h-mid
 */
public class VGController implements Initializable {

    @FXML
    private TableView<Fourni> list_fourni;
    @FXML
    private TableColumn<Fourni, String> col_nom;
    @FXML
    private TableColumn<Fourni, String> col_ville;
    @FXML
    private TableColumn<Fourni, String> col_id;
    @FXML
    private TextField txt_nom;
    @FXML
    private TextField txt_adresse;
    @FXML
    private TextField txt_cp;
    @FXML
    private TextField txt_ville;
    @FXML
    private ComboBox<Pays> txt_pays;
    @FXML
    private TextField txt_mail;
    @FXML
    private TextField txt_fixe;
    @FXML
    private TextField txt_mobil;
    @FXML
    private TextField txt_contact;
    @FXML
    private TextField txt_nom1;
    @FXML
    private TextField txt_adresse1;
    @FXML
    private TextField txt_cp1;
    @FXML
    private TextField txt_ville1;
    @FXML
    private ComboBox<Pays> txt_pays1;
    @FXML
    private TextField txt_mail1;
    @FXML
    private TextField txt_fixe1;
    @FXML
    private TextField txt_mobil1;
    @FXML
    private TextField txt_contact1;
    @FXML
    private Label Error_ajout;//affichage message d'erreur
    @FXML
    private Label Error_modif;
    @FXML
    private Pane pane_ajout;//afficher le panneau ajout
    @FXML
    private Pane pane_detail;
    /**
     * The Dao.
     */
    FourniDAO dao = new FourniDAO();
    /**
     * The Model.
     */
    //load model (chargé le modal 
    ObservableList<Fourni> model = FXCollections.observableArrayList(dao.List());

    PaysDAO p = new PaysDAO();

    ObservableList<Pays> pays = FXCollections.observableArrayList(p.List());

    /**
     * Initializes the controller class.
     *
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        txt_pays.setItems(pays);
        txt_pays1.setItems(pays);
        // Jonction du tableau avec les données
        col_nom.setCellValueFactory(new PropertyValueFactory<>("nom"));
        col_ville.setCellValueFactory(new PropertyValueFactory<>("ville"));
        col_id.setCellValueFactory(new PropertyValueFactory<>("id"));

        // On indique au TableView quelle modèle observer pour trouver les données(vue)
        list_fourni.setItems(model);
    }

    @FXML
    private void add_click(ActionEvent event) {//clic sur button ajout
        pane_ajout.setVisible(true);//afficher le formulaire ajout
        pane_detail.setVisible(false);

    }

    @FXML
    private void update_click(ActionEvent event) {

        pane_detail.setVisible(true);//afficher le formulaire detail
        pane_ajout.setVisible(false);
        
        int idx = list_fourni.getSelectionModel().getSelectedItem().getId(); //on recupere l'id et on stock

        txt_nom1.setText(list_fourni.getSelectionModel().getSelectedItem().getNom());
        txt_adresse1.setText(list_fourni.getSelectionModel().getSelectedItem().getAdresse());
        txt_cp1.setText(list_fourni.getSelectionModel().getSelectedItem().getCp());
        txt_ville1.setText(list_fourni.getSelectionModel().getSelectedItem().getVille());
        txt_fixe1.setText(list_fourni.getSelectionModel().getSelectedItem().getTel());
        txt_mobil1.setText(list_fourni.getSelectionModel().getSelectedItem().getMobile());
        txt_contact1.setText(list_fourni.getSelectionModel().getSelectedItem().getContact());
        txt_mail1.setText(list_fourni.getSelectionModel().getSelectedItem().getMail());
        int id = txt_pays1.getSelectionModel().getSelectedItem().getId();
        //txt_pays1.setText(list_fourni.getSelectionModel().getSelectedItem().getPays());
        //txt_pays1.setText(f.Find(list_fourni.getSelectionModel().getFocusedIndex()).getPays());
        //txt_pays1.getSelectionModel().getSelectedItem().getId();
        //txt_pays1.setPays(list_fourni.getSelectionModel().getSelectedItem().getId());

    }

    @FXML
    private void delete(ActionEvent event) {
        //supprimer ligne avec remove (getselectionmodel c'est colonne getselectionindex c'est index)
        // supprimer une ligne par son index
        FourniDAO supp = new FourniDAO();
        int idx = list_fourni.getSelectionModel().getSelectedItem().getId(); //on recupere l'id et on stock
        model.remove(list_fourni.getSelectionModel().getSelectedIndex());//supp dans la vu
        supp.Delete(idx);//on passe l id en argu pour la supp
    }

    @FXML
    private void OK_Insert(ActionEvent event) {

        FourniDAO ajout = new FourniDAO();
        Fourni f = new Fourni();
        boolean isOk = true;
//déclaration de regx
        Pattern reg_text = Pattern.compile("^[^@+=|><\\]\\[{}]+$");
        Pattern reg_mail = Pattern.compile("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
        Pattern reg_num = Pattern.compile("^\\d[\\d-.]{0,9}$");
        Pattern reg_cp = Pattern.compile("^\\d[\\d-.]{0,9}$");
//déclaration de variable a comparer avec regex
        String nom = this.txt_nom.getText();
        String adresse = this.txt_adresse.getText();
        String ville = this.txt_ville.getText();
        String cp = this.txt_cp.getText();
        String mail = this.txt_mail.getText();
        String tel = this.txt_fixe.getText();
        String mobile = this.txt_mobil.getText();
        String contact = this.txt_contact.getText();

//nom
        if (reg_text.matcher(nom).matches()) {
            f.setNom(txt_nom.getText());// assigner les valeurs nom saisi au f a inserer 
            txt_nom.setStyle("");
        } else {
            txt_nom.setStyle("-fx-border-color :red");
            Error_ajout.setVisible(true);
            isOk = false;
        }
//adresse
        if (reg_text.matcher(adresse).matches()) {
            f.setAdresse((adresse));// assigner les valeurs nom saisi au c a inserer 
            txt_adresse.setStyle("");
        } else {
            txt_adresse.setStyle("-fx-border-color :red");
            Error_ajout.setVisible(true);
            isOk = false;

        }
//ville
        if (reg_text.matcher(ville).matches()) {
            f.setVille(ville);// assigner les valeurs nom saisi au c a inserer 
            txt_ville.setStyle("");

        } else {
            txt_ville.setStyle("-fx-border-color :red");
            Error_ajout.setVisible(true);
            isOk = false;
        }
        //cp
        if (reg_cp.matcher(cp).matches()) {
            f.setCp(cp);// assigner les valeurs nom saisi au c a inserer 
            txt_cp.setStyle("");

        } else {
            txt_cp.setStyle("-fx-border-color :red");
            Error_ajout.setVisible(true);
            isOk = false;
        }
        //mail
        if (reg_mail.matcher(mail).matches()) {
            f.setMail(mail);// assigner les valeurs nom saisi au c a inserer 
            txt_mail.setStyle("");

        } else {
            txt_mail.setStyle("-fx-border-color :red");
            Error_ajout.setVisible(true);
            isOk = false;
        }
        //tel fixe 
        if (reg_num.matcher(tel).matches()) {
            f.setTel(tel);// assigner les valeurs nom saisi au c a inserer 
            txt_fixe.setStyle("");
        } else {
            txt_fixe.setStyle("-fx-border-color :red");
            Error_ajout.setVisible(true);
            isOk = false;
        }
        //tel mobiile 
        if (reg_num.matcher(mobile).matches()) {
            f.setMobile(mobile);// assigner les valeurs nom saisi au c a inserer 
            txt_mobil.setStyle("");
        } else {
            txt_mobil.setStyle("-fx-border-color :red");
            Error_ajout.setVisible(true);
            isOk = false;
        }
        //contact 
        if (reg_text.matcher(contact).matches()) {
            f.setMail(contact);// assigner les valeurs nom saisi au c a inserer 
            txt_contact.setStyle("");
        } else {
            txt_contact.setStyle("-fx-border-color :red");
            Error_ajout.setVisible(true);
            isOk = false;
        }

        if (isOk) { // si regex accepté , pas d erreur 
            Error_ajout.setVisible(false);
            f.setNom(txt_nom.getText());// assigner les valeurs nom saisi au c a inserer 
            f.setAdresse(txt_adresse.getText());
            f.setVille(txt_ville.getText());
            f.setCp(txt_cp.getText());
            f.setMail(txt_mail.getText());
            f.setTel(txt_fixe.getText());
            f.setMobile(txt_mobil.getText());
            f.setContact(txt_contact.getText());

            //pour ajouter id pays ??? 
            f.setPays(txt_pays.getSelectionModel().getSelectedItem().getId());

            ajout.Insert(f);//appel de la methose insert de la class clientDAO
            model.add(f);//ajout dans le tableau vu (model)
        }
    }

    @FXML
    private void Effacer(ActionEvent event) {
        //efface champs ajout
        txt_nom.clear();
        txt_cp.clear();
        txt_adresse.clear();
        txt_ville.clear();
        txt_fixe.clear();
        txt_mobil.clear();
        txt_mail.clear();
        txt_contact.clear();

        // efface champs modif
        txt_nom1.clear();
        txt_adresse1.clear();
        txt_cp1.clear();
        txt_ville1.clear();
        txt_fixe1.clear();
        txt_mobil1.clear();
        txt_mail1.clear();
        txt_contact1.clear();

    }

    @FXML
    private void Annuler(ActionEvent event) {
        pane_ajout.setVisible(false);
        pane_detail.setVisible(false);

//efface champs ajout
        txt_nom.clear();
        txt_cp.clear();
        txt_adresse.clear();
        txt_ville.clear();
        txt_fixe.clear();
        txt_mobil.clear();
        txt_mail.clear();
        txt_contact.clear();

        // efface champs modif
        txt_nom1.clear();
        txt_adresse1.clear();
        txt_cp1.clear();
        txt_ville1.clear();
        txt_fixe1.clear();
        txt_mobil1.clear();
        txt_mail1.clear();
        txt_contact1.clear();
    }

    @FXML
    private void OK_Update(ActionEvent event) {

        FourniDAO modif = new FourniDAO();
        Fourni f = new Fourni();
        boolean isOk = true;
//déclaration de regx
        Pattern reg_text = Pattern.compile("^[^@+=|><\\]\\[{}]+$");
        Pattern reg_mail = Pattern.compile("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
        Pattern reg_num = Pattern.compile("^\\d[\\d-.]{0,9}$");
        Pattern reg_cp = Pattern.compile("^\\d[\\d-.]{0,9}$");
//déclaration de variable a comparer avec regex
        String nom = this.txt_nom1.getText();
        String adresse = this.txt_adresse1.getText();
        String ville = this.txt_ville1.getText();
        String cp = this.txt_cp1.getText();
        String mail = this.txt_mail1.getText();
        String tel = this.txt_fixe1.getText();
        String mobile = this.txt_mobil1.getText();
        String contact = this.txt_contact1.getText();
        String pays = this.txt_pays1.getId();

//nom
        if (reg_text.matcher(nom).matches()) {
            f.setNom(txt_nom1.getText());// assigner les valeurs nom saisi au f a inserer 
            txt_nom1.setStyle("");
        } else {
            txt_nom1.setStyle("-fx-border-color :red");
            Error_modif.setVisible(true);
            isOk = false;
        }
//adresse
        if (reg_text.matcher(adresse).matches()) {
            f.setAdresse((adresse));// assigner les valeurs nom saisi au c a inserer 
            txt_adresse1.setStyle("");
        } else {
            txt_adresse1.setStyle("-fx-border-color :red");
            Error_modif.setVisible(true);
            isOk = false;

        }
//ville
        if (reg_text.matcher(ville).matches()) {
            f.setVille(ville);// assigner les valeurs nom saisi au c a inserer 
            txt_ville1.setStyle("");

        } else {
            txt_ville1.setStyle("-fx-border-color :red");
            Error_modif.setVisible(true);
            isOk = false;
        }
        //cp
        if (reg_cp.matcher(cp).matches()) {
            f.setCp(cp);// assigner les valeurs nom saisi au c a inserer 
            txt_cp1.setStyle("");

        } else {
            txt_cp1.setStyle("-fx-border-color :red");
            Error_modif.setVisible(true);
            isOk = false;
        }
        //mail
        if (reg_mail.matcher(mail).matches()) {
            f.setMail(mail);// assigner les valeurs nom saisi au c a inserer 
            txt_mail1.setStyle("");

        } else {
            txt_mail1.setStyle("-fx-border-color :red");
            Error_modif.setVisible(true);
            isOk = false;
        }
        //tel fixe 
        if (reg_num.matcher(tel).matches()) {
            f.setTel(tel);// assigner les valeurs nom saisi au c a inserer 
            txt_fixe1.setStyle("");
        } else {
            txt_fixe1.setStyle("-fx-border-color :red");
            Error_modif.setVisible(true);
            isOk = false;
        }
        //tel mobiile 
        if (reg_num.matcher(mobile).matches()) {
            f.setMobile(mobile);// assigner les valeurs nom saisi au c a inserer 
            txt_mobil1.setStyle("");
        } else {
            txt_mobil1.setStyle("-fx-border-color :red");
            Error_modif.setVisible(true);
            isOk = false;
        }
        //contact 
        if (reg_text.matcher(contact).matches()) {
            f.setMail(contact);// assigner les valeurs nom saisi au c a inserer 
            txt_contact1.setStyle("");
        } else {
            txt_contact1.setStyle("-fx-border-color :red");
            Error_modif.setVisible(true);
            isOk = false;
        }

        if (isOk) { // si regex accepté , pas d erreur 
            Error_modif.setVisible(false);
            f.setNom(txt_nom1.getText());// assigner les valeurs nom saisi au c a inserer 
            f.setAdresse(txt_adresse1.getText());
            f.setCp(txt_cp1.getText());
            f.setVille(txt_ville1.getText());
            f.setPays(txt_pays1.getSelectionModel().getSelectedItem().getId());
            f.setMail(txt_mail1.getText());
            f.setTel(txt_fixe1.getText());
            f.setMobile(txt_mobil1.getText());
            f.setContact(txt_contact1.getText());
            modif.Update(f);//appel de la methose upadte de la class FourniDAO
            list_fourni.refresh();//rafréchir la liste tableau
            pane_detail.setVisible(false);  //cacher le pane affiche detail 
        }
    }

    private boolean setVisible() {
        throw new UnsupportedOperationException("Not supported yet.");
//To change body of generated methods, choose Tools | Templates.
    }

}
