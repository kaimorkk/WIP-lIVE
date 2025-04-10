Table 52193740 Publication1
{

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Name;Text[100])
        {
        }
        field(3;Description;Text[100])
        {
        }
        field(4;Attachment;Option)
        {
            OptionCaption = 'No,yes';
            OptionMembers = No,yes;
        }
        field(5;"Language Code (Default)";Text[30])
        {
        }
        field(6;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(7;"Employee No.";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                 if Employee.Get("Employee No.") then begin
                    "Employee Name":=Employee."First Name" +' '+Employee."Middle Name" + ' '+Employee."Last Name";
                     //"User Email":=Employee."E-Mail";

                   Dimension.Get('DEPARTMENT', Employee."Global Dimension 1 Code");

                   Department:=Dimension.Name;
                                    end;
            end;
        }
        field(8;"Employee Name";Text[80])
        {
        }
        field(9;Department;Text[80])
        {
        }
        field(10;"Date Of submission";Date)
        {
        }
        field(11;Status;Option)
        {
            OptionMembers = open,Sent;
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

    trigger OnInsert()
    begin
          if Code ='' then begin
          MarketingSetup.Get();
          MarketingSetup.TestField("Publication Nos");
          NoSeriesMngt.InitSeries(MarketingSetup."Publication Nos",xRec.Code,0D,Code,"No. Series");
          end;
    end;

    var
        MarketingSetup: Record "Marketing Setup";
        NoSeriesMngt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        users: Record "User Setup";
        Dimension: Record "Dimension Value";
}

