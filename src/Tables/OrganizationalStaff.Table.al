Table 52193614 "Organizational Staff"
{

    fields
    {
        field(1;"Code";Code[10])
        {
            Caption = 'Code';
            NotBlank = false;
        }
        field(2;Name;Text[50])
        {
            Caption = 'Name';
        }
        field(50000;"Identification No.";Text[30])
        {
        }
        field(50001;Gender;Option)
        {
            OptionMembers = Male,Female;
        }
        field(50002;Address;Text[50])
        {
        }
        field(50003;Telephone;Text[30])
        {
        }
        field(50004;"Date of Birth";Date)
        {
        }
        field(50005;"Supervisor or Credit Officer";Option)
        {
            OptionMembers = "Credit Officer",Supervisor;
        }
        field(50006;Supervisor;Code[10])
        {
        }
        field(50007;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50008;"Phone No.";Text[30])
        {
        }
        field(50009;"E-mail";Text[30])
        {
        }
        field(50010;"Supervisor Name";Text[30])
        {
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

