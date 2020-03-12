import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";
  String _email = "";
  String _password = "";
  String _date = "";
  String _select = 'Opción 1';


  TextEditingController _inputDate = new TextEditingController();
  List<String> _menuOptions = ['Opción 1', 'Opción 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Inputs'),
       ),
       body: ListView(
         padding: EdgeInsets.symmetric(
           horizontal: 10.0,
           vertical: 20.0
         ),
         children: <Widget>[
           _createInput(),
           Divider(),
           _createEmail(),
           Divider(),
           _createPassword(),
           Divider(),
           _createDate(context),
           Divider(),
           _createDropDown(context),
           Divider(),
           _createPerson()
         ],
       ),
    );
  }

  Widget _createInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Cantidad de letras: ${ _nombre.length }'),
        hintText: 'Nombre',
        labelText: 'Nombre',
        helperText: 'Solo nombre',
        suffixIcon: Icon(Icons.person_pin),
        icon: Icon(Icons.person)
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
          print(_nombre);
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'email@example.com',
        labelText: 'Email',
        helperText: 'Ingresa e-mail válido',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (value) => setState(() {
        _email = value;
        print(_email);
      }),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'contraseña',
        labelText: 'Contraseña',
        helperText: 'Ingresa una contraseña válida',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (value) => setState(() {
        _password = value;
        print(_password);
      }),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _inputDate,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: '10/23/1992',
        labelText: 'Fecha de nacimiento',
        helperText: 'Ingresa una fecha',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime pick = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if(pick != null) {
      setState(() {
        _date = pick.toString();
        _inputDate.text = _date;
      });
    }
  }

  Widget _createDropDown(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            value: _select,
            items: _getMenuOptions(),
            onChanged: (value) {
              print(value);
              setState(() {
                _select = value;
              });
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> _getMenuOptions() {

      List<DropdownMenuItem<String>> items = new List();

      _menuOptions.forEach((option) {
        items.add(DropdownMenuItem(
          child: Text(option),
          value: option
        ));
      }); 

      return items;
  }

  Widget _createPerson() {
    return ListTile(
      title:  Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Opción: $_select'),
    );
  }






}