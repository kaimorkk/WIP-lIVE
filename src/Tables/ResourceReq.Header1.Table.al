Table 52193941 "Resource Req. Header1"
{
    DrillDownPageID = "Resource Req. Header List";
    LookupPageID = "Resource Req. Header List";

    fields
    {
        field(1;"Request No.";Code[20])
        {
        }
        field(2;"Employee Code";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                 if Emp.Get("Employee Code") then
                 "Employee Name":=Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name" ;
            end;
        }
        field(3;"Employee Name";Text[100])
        {
        }
        field(4;USER;Code[30])
        {
        }
        field(5;"Request Status";Option)
        {
            OptionMembers = Open,"Pending Allocation",Allocated,Canceled,Rejected,Issued,Returned;
        }
        field(6;"Request Date";Date)
        {
        }
        field(7;"Issue Date";Date)
        {
        }
        field(8;"Returned date";Date)
        {
        }
        field(9;"Issuer ID";Code[30])
        {
        }
        field(10;"Issuer Name";Text[30])
        {
        }
        field(11;"No. Series";Code[20])
        {
        }
        field(12;"Department Code";Code[10])
        {
            TableRelation = "Dimension Value";
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
           if "Request Status"="request status"::Open then
            begin
             if "Request No." = '' then begin
          HRSetup.Get;
          //HRSetup."DMS LINK"
          HRSetup.TestField(HRSetup."Resource Request Nos");
          NoSeriesMgt.InitSeries(HRSetup."Resource Request Nos",xRec."Request No.",0D,"Request No.","No. Series");
        end;
        end;

        if UserSertup.Get(UserId) then
        begin
         "Employee Code":=UserSertup."Employee No.";
         Validate("Employee Code");
         USER:=UserId;
         if Emp.Get("Employee Code") then
         "Employee Name":=Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name"
        // "Department Code":=Emp."Global Dimension 1 Code";
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        Emp: Record Employee;
        UserSertup: Record "User Setup";
}

