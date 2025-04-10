Table 52193806 "Visit to Utilities1"
{

    fields
    {
        field(1;"Visit No";Code[20])
        {
        }
        field(2;"Utility No";Code[20])
        {
            TableRelation = Contact;

            trigger OnValidate()
            begin
                  if ContactRec.Get("Utility No") then
                  "Utility Name":=ContactRec.Name;
            end;
        }
        field(3;"Utility Name";Text[50])
        {
        }
        field(4;"Visit Start Date";Date)
        {
        }
        field(5;"Visit End Date";Date)
        {
        }
        field(6;"No. Of Staff Visiting";Integer)
        {
            CalcFormula = count("Visiting Employees1" where ("Visit No"=field("Visit No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;"No. Series";Code[10])
        {
        }
        field(8;"Language Code (Default)";Code[10])
        {
        }
        field(9;Attachment;Option)
        {
            OptionMembers = No,Yes;
        }
        field(10;Status;Option)
        {
            OptionMembers = Open,"Pending Approval",Rejected,Approved;
        }
    }

    keys
    {
        key(Key1;"Visit No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Visit No" = '' then begin
          RMSetup.Get;
          RMSetup.TestField(RMSetup."Survey Nos");
          NoSeriesMgt.InitSeries(RMSetup."Survey Nos",xRec."No. Series",0D,"Visit No","No. Series");
        end;
    end;

    var
        ContactRec: Record Contact;
        RMSetup: Record "Marketing Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

