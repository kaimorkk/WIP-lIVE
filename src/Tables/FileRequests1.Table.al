Table 52193726 "File Requests1"
{
    DrillDownPageID = "File Requests list";
    LookupPageID = "File Requests list";

    fields
    {
        field(1;"Request No";Code[50])
        {
            NotBlank = false;
        }
        field(2;"File No";Code[50])
        {
            TableRelation = "File Details1";

            trigger OnValidate()
            begin
                 /*Fil.GET("File No");
                 "File Name":=Fil."File Description";
                 MODIFY;
                  */

            end;
        }
        field(3;"File Name";Text[100])
        {
        }
        field(4;Date;Date)
        {
        }
        field(5;Time;Time)
        {
        }
        field(6;"Employee No";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Employee No") then
                "Employee Name":=Emp."First Name"+' '+Emp."Last Name"
                else
                "Employee Name":='';
                //MODIFY;
            end;
        }
        field(7;"Employee Name";Text[30])
        {
        }
        field(8;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(9;"Send Status";Boolean)
        {
        }
        field(10;"System Support Email Address";Text[80])
        {
        }
        field(11;User;Code[100])
        {
            TableRelation = User;
        }
    }

    keys
    {
        key(Key1;"Request No")
        {
            Clustered = true;
        }
        key(Key2;Date)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Request No" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField("File Req No");
          NoSeriesMgt.InitSeries(SalesSetup."File Req No",xRec."No. Series",0D,"Request No","No. Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
        User:=UserId;

        if Users.Get(UserId)then begin
        //"User email Address":=Users."User Email";
        "Employee No":=Users."Employee No.";
        Validate("Employee No");
        end;
    end;

    var
        Fil: Record "File Details1";
        Emp: Record Employee;
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Users: Record "User Setup";
}

