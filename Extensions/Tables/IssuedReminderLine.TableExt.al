TableExtension 52193517 tableextension52193517 extends "Issued Reminder Line" 
{
    fields
    {
        modify(Type)
        {
            OptionCaption = ' ,G/L Account,Customer Ledger Entry';

            //Unsupported feature: Property Modification (OptionString) on "Type(Field 4)".

        }
        modify("No.")
        {
            TableRelation = if (Type=const(" ")) "Standard Text"
                            else if (Type=const("G/L Account")) "G/L Account";
        }
        modify("Line Type")
        {
            OptionCaption = 'Reminder Line,Not Due,Beginning Text,Ending Text,Rounding,On Hold,Additional Fee';

            //Unsupported feature: Property Modification (OptionString) on ""Line Type"(Field 25)".

        }

        //Unsupported feature: Deletion (FieldCollection) on ""Applies-To Document Type"(Field 27)".


        //Unsupported feature: Deletion (FieldCollection) on ""Applies-To Document No."(Field 28)".

    }
}

