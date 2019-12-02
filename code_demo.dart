////////////// ****************************** ////////////////////

// Flutter Code Reference
// The Code in this file is not a project non is it a demo
// work, it's just code to reference ro will i say code that
// I added to make me remember or go back to code i can't recall
// at the time of this push, i have just little basic knowledge of 
//Flutter, so I'm dropping this code in my repo so i can go back to
// it when i need anything i can't recall, you can also use this for 
// reference if you are also learning.

////////////// ****************************** //////////////////////


// this works like declaring an id
TextEditingController principalController = TextEditingController();
TextEditingController rateController = TextEditingController();
TextEditingController termController = TextEditingController();
//////////////////////////////////////////////////


/////////////////// Text Form Field with validations///////
TextFormField(
          controller: principalController,
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  // ignore: missing_return
                  validator: (String value){
                    if(value.isEmpty){
                      return "Please enter Principal Amount";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Pricipal",
                      hintText: "Enter a Pricipal value e.g. 1500",
                      labelStyle: textStyle,
                      errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
/////////////////////////////////////////////////////////////////////

////////////////// Raise Button code //////////////////////////////
RaisedButton(
    color: Theme.of(context).accentColor,
     textColor: Theme.of(context).primaryColorDark,
      child: Text("Calculate", style: textStyle,),
        onPressed: () {
             setState(() {
                if(_formKey.currentState.validate()){
                    this.displayResult = _calculateTotalReturns();
                }
              );
            },
          ),
/////////////////////////////////////////////////////////////////////////

///////////////////// Drop down button /////////////////////////////////

var _currencies = ["Naira", "Dollar", "Pounds",];// use this for the selection
var _currectlySelectedItem = ""; // use this for selected item

void initState() { // initialize the state and fix the default item selected value
    super.initState();
    _currectlySelectedItem = _currencies[0];
  }

DropdownButton<String>(

   items: _currencies.map((String dropDownStringItem){

      return DropdownMenuItem<String> (

        value: dropDownStringItem,
        child: Text(dropDownStringItem),
     );

    }).toList(),

        alue: _currectlySelectedItem,

        onChanged: (String newItemSelected){
         _onDropdownItemSelected(newItemSelected);
        },
),

///////////////////////////////////////////////////////////////////////


/////////////////////// code to set Imgage ///////////////////////

Widget getImageAsset() {

    AssetImage assetImage = AssetImage("images/money.png");
    Image image = Image(image: assetImage, width: 125.0, height: 125.0,);

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }
  ////////////////////////////////////////////////////////////////
  ///
  ///
  
  ////////////////////// setting a Global Key for the form ////////
  
  var _formKey = GlobalKey<FormState>();

  Form(
        key: _formKey,
  )