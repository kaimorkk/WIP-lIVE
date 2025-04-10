Table 52193954 "Telephone Request1"
{
    DrillDownPageID = "Telephone Request List";
    LookupPageID = "Telephone Request List";

    fields
    {
        field(1;"Request No.";Code[20])
        {
        }
        field(2;"Request Date";Date)
        {
        }
        field(3;"Employee No";Code[20])
        {
        }
        field(4;"Employee Name";Text[50])
        {
        }
        field(5;"No. Series";Code[10])
        {
        }
        field(6;Status;Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
        }
        field(7;"Contact No";Code[20])
        {
            TableRelation = Contact;
        }
        field(8;"User ID";Code[20])
        {
        }
        field(9;"No of Approval";Integer)
        {
            CalcFormula = count("Approval Entry" where ("Table ID"=const(69210),
                                                        "Document No."=field("Request No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Request No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Request No." = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Telephone Request Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Telephone Request Nos",xRec."No. Series",0D,"Request No.","No. Series");
        end;
         "Request Date":=Today;
         "User ID":=UserId;
          if UserSetup.Get(UserId) then
          begin
          "Employee No":=UserSetup."Employee No.";
           if Empl.Get(UserSetup."Employee No.") then
           "Employee Name":=Empl."First Name"+ ' '+Empl."Middle Name"+' '+Empl."Last Name";
          end;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        Empl: Record Employee;
}

