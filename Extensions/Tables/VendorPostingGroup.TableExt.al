TableExtension 52193458 tableextension52193458 extends "Vendor Posting Group" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Code(Field 1)".

        field(50000;"Savings Account";Code[20])
        {
            Caption = 'Savings Account';
            Editable = true;
            TableRelation = "G/L Account";
        }
        field(50001;"Thalaboliba Account";Code[20])
        {
            Caption = 'Thalaboliba Account';
            TableRelation = "G/L Account";
        }
        field(50002;"Modula Quoa Account";Code[20])
        {
            Caption = 'Modula Quoa Account';
            TableRelation = "G/L Account";
        }
        field(50003;"Fixed Deposit Account";Code[20])
        {
            Caption = 'Fixed Deposit Account';
            TableRelation = "G/L Account";
        }
        field(50004;"Membership Account";Code[20])
        {
            Caption = 'Membership Account';
            TableRelation = "G/L Account";
        }
    }
}

