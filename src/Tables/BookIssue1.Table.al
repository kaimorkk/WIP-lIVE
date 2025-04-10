Table 52193728 "Book Issue1"
{
    DrillDownPageID = "Book request list";
    LookupPageID = "Book request list";

    fields
    {
        field(1;"Request No.";Code[100])
        {
        }
        field(2;"Employee No";Code[50])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                  if Emp.Get("Employee No") then
                  "Employee Name":=Emp."First Name"+' '+Emp."Last Name"
                  else
                  "Employee Name":='';

                "System Support Email Address":=Emp."Company E-Mail"
            end;
        }
        field(3;"Employee Name";Text[80])
        {
        }
        field(6;"Request Date";Date)
        {
        }
        field(7;"Issue Date";Date)
        {
        }
        field(8;"Due Date";Date)
        {
        }
        field(9;"Issuer No.";Code[50])
        {
            TableRelation = Employee;
        }
        field(10;"Issuer Name.";Text[80])
        {
        }
        field(11;Requested;Boolean)
        {
        }
        field(12;"System Support Email Address";Text[80])
        {
        }
        field(14;"No. Series";Code[50])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15;User;Code[50])
        {
            TableRelation = User;
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

        if "Request No."= '' then begin

          SalesSetup.Get;
          SalesSetup.TestField(SalesSetup."Book Requisition No");
          NoSeriesMgt.InitSeries(SalesSetup."Book Requisition No",xRec."Request No.",0D,"Request No.","No. Series");

        end;


        if Users.Get(UserId)then begin
        //"User email Address":=Users."User Email";
        "Employee No":=Users."Employee No.";
        Validate("Employee No");
        end;
        User:=UserId;
    end;

    var
        Emp: Record Employee;
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Users: Record "User Setup";
}

