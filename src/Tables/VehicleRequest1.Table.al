Table 52193725 "Vehicle Request1"
{
    //DrillDownPageID = UnknownPage51058;
    //LookupPageID = UnknownPage51058;

    fields
    {
        field(1; "Requisition No."; Code[10])
        {

            trigger OnValidate()
            begin
                if "Requisition No." <> "Requisition No." then begin
                    SalesSetup.Get;
                    NoSeriesMgt.TestManual(SalesSetup."Requisition No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Employee No"; Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Employee No") then
                    "Employee Name" := Emp."First Name" + ' ' + Emp."Last Name"
                else
                    "Employee Name" := '';
                Modify;
            end;
        }
        field(3; "Employee Name"; Text[50])
        {
        }
        field(4; Department; Code[10])
        {
            //TableRelation = Table51035;

            trigger OnValidate()
            begin
                /*
                IF Dep.GET(Department) THEN
                "Department Name":=Dep."Photocopier Model"
                ELSE
                "Department Name":='';
                MODIFY;
                */

            end;
        }
        field(5; Purpose; Text[200])
        {
        }
        field(6; "Date of travel"; Date)
        {
        }
        field(7; "Time of Travel"; Time)
        {
        }
        field(8; "HOD Name"; Text[80])
        {
        }
        field(9; "HOD Approval  Date"; Date)
        {
        }
        field(10; "Vehicle Allocated"; Code[10])
        {
            TableRelation = "Fixed Asset" where("FA Subclass Code" = const('MV'));

            trigger OnValidate()
            begin
                FA.Get("Vehicle Allocated");
                "Vehicle identification" := FA.Description + ' ' + FA."Serial No."
            end;
        }
        field(11; "Driver No"; Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Get("Driver No");
                "Driver Name" := Emp."First Name" + ' ' + Emp."Last Name";
            end;
        }
        field(12; "Driver Name"; Text[80])
        {
        }
        field(13; "Allocation Date"; Date)
        {
        }
        field(14; Approved; Boolean)
        {
        }
        field(15; "HOD Approval"; Boolean)
        {
        }
        field(16; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(17; "Department Name"; Text[30])
        {
        }
        field(18; "User request"; Code[10])
        {
            TableRelation = User;
        }
        field(19; "HOD ID"; Code[10])
        {
            TableRelation = User;
        }
        field(20; "Admin ID"; Code[10])
        {
            TableRelation = User;
        }
        field(21; "HOD No"; Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("HOD No") then
                    "HOD Name" := Emp."First Name" + ' ' + Emp."Last Name"
                else
                    "HOD Name" := '';
                Modify;
            end;
        }
        field(22; Destination; Text[80])
        {
        }
        field(23; "Appication Date"; Date)
        {
        }
        field(24; "Vehicle identification"; Text[100])
        {
        }
        field(25; "HOD Reject"; Boolean)
        {
        }
        field(26; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(27; RequestorID; Code[10])
        {
        }
        field(28; "Return Date"; Date)
        {
        }
        field(29; "Return Time"; Time)
        {
        }
        field(30; User; Code[10])
        {
            TableRelation = User;
        }
        field(31; Allocated; Boolean)
        {
        }
        field(32; "Admin Email"; Text[80])
        {
        }
        field(33; "Registry Email"; Text[80])
        {
        }
        field(34; "Benefits Email"; Text[80])
        {
        }
        field(35; "Finance Email"; Text[80])
        {
        }
        field(36; "HR Email"; Text[80])
        {
        }
        field(37; "Audit Email"; Text[80])
        {
        }
        field(38; "Marketing Email"; Text[80])
        {
        }
        field(39; "Property Email"; Text[80])
        {
        }
        field(40; "ICT Email"; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; "Requisition No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Requisition No." = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField("Requisition No");
            NoSeriesMgt.InitSeries(SalesSetup."Requisition No", xRec."Requisition No.", 0D, "Requisition No.", "No. Series");
            //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
        /*RequestorID:=USERID;
        IF Users.GET(USERID) THEN BEGIN
        "Employee No":=Users."Employee No.";
        
        IF Emp.GET("Employee No") THEN
        "Employee Name":=Emp."First Name"+' '+Emp."Last Name"
        ELSE
        "Employee Name":='';
        "Global Dimension 1 Code":=Emp."Global Dimension 1 Code";
        
        END;
        */
        //MODIFY;
        User := UserId;

        if Users.Get(UserId) then begin
            //"User email Address":=Users."User Email";
            "Employee No" := Users."Employee No.";
            if Emp.Get(Users."Employee No.") then
                "Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";

        end;

    end;

    var
        Emp: Record Employee;
        SalesSetup: Record "Sales & Receivables Setup";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FA: Record "Fixed Asset";
        Users: Record "User Setup";
}

