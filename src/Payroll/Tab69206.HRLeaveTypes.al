
table 52194110 "HR Leave Types"
{
    LookupPageID = "HR Leave Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[40])
        {
            NotBlank = true;
        }
        field(2; Description; Text[200])
        {
        }
        field(3; Days; Decimal)
        {
            DecimalPlaces = 0;
        }
        field(4; "Acrue Days"; Boolean)
        {

        }
        field(5; "Unlimited Days"; Boolean)
        {
        }
        field(6; Gender; Option)
        {
            OptionCaption = ' ,Female,Male,Both';
            OptionMembers = " ",Female,Male,Both;
        }
        field(7; Balance; Option)
        {
            OptionCaption = 'Ignore,Carry Forward,Convert to Cash';
            OptionMembers = Ignore,"Carry Forward","Convert to Cash";
        }
        field(8; "Inclusive of Holidays"; Boolean)
        {
        }
        field(9; "Inclusive of Saturday"; Boolean)
        {
        }
        field(10; "Inclusive of Sunday"; Boolean)
        {
        }
        field(11; "Off/Holidays Days Leave"; Boolean)
        {
        }
        field(12; "Max Carry Forward Days"; Decimal)
        {
            DecimalPlaces = 0;
        }
        field(13; "Inclusive of Non Working Days"; Boolean)
        {
        }
        field(14; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(15; "Carry Forward Allowed"; Boolean)
        {
        }
        field(16; "Fixed Days"; Boolean)
        {
        }
        field(17; Annual; Boolean)
        {
        }
        field(18; "Grace Period(in Days )"; Decimal)
        {
            DecimalPlaces = 0;
        }
        field(19; "Posting Type"; Option)
        {
            OptionCaption = 'Annual,Compassionate,Marternity,Parternity,Sick Leave,Study Leave,Sports Leave,Unpaid Leave,Terminal Leave,Off Days,Abscence,Adoption,Examination,Sabbatical,Special Sports,Home Leave';
            OptionMembers = Annual,Compassionate,Marternity,Parternity,"Sick Leave","Study Leave","Sports Leave","Unpaid Leave","Terminal Leave","Off Days",Abscence,Adoption,Examination,Sabbatical,"Special Sports","Home Leave";
        }
        field(20; "Attachment Mandatory"; Boolean)
        {
        }
        field(21; "Multiple Allocations"; Boolean)
        {
        }
        field(22; "Detailed Description"; Text[250])
        {
        }
        field(23; "Hardship Grace Period"; DateFormula)
        {
        }
        field(24; Adoption; Boolean)
        {
        }
        field(25; "Max Carry Forward 2"; Integer)
        {
            Caption = 'Max Carry Forward Over 55';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

