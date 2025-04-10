Table 52193865 "HR Career History1"
{
    DataCaptionFields = "Employee No.", "Date Of Event", "Career Event", Department, "Job Title", Pay, "Contract Type";
    // //DrillDownPageID = UnknownPage52059;
    // //LookupPageID = UnknownPage52059;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = "HR Employee1"."No.";

            trigger OnValidate()
            begin
                GetEmployeeInfo;
                OK := Employee.Get("Employee No.");
                if OK then begin
                    "Employee First Name" := Employee."Known As";
                    "Employee Last Name" := Employee."Last Name";
                end;
            end;
        }
        field(2; "Date Of Event"; Date)
        {
        }
        field(3; "Career Event"; Text[60])
        {
        }
        field(4; Department; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee.Office := Department;
                    Employee.Modify;
                end;
            end;
        }
        field(5; Directorate; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Department Code" := Directorate;
                    Employee.Modify;
                end;
            end;
        }
        field(6; "Job Title"; Text[45])
        {
            TableRelation = "Company Jobs1"."Job Description";

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Job Title" := "Job Title";
                    Employee.Modify;
                end;
            end;
        }
        field(7; Location; Text[50])
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee.City := Location;
                    Employee.Modify;
                end;
            end;
        }
        field(8; Pay; Decimal)
        {
        }
        field(9; "Full/Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time";

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Full / Part Time" := "Full/Part Time";
                    Employee.Modify;
                end;
            end;
        }
        field(10; "Contract Type"; Code[20])
        {

            trigger OnValidate()
            begin
                //Employee.SETRANGE("No.","Employee No.");
                //OK:= Employee.FIND('-');
                //IF OK THEN BEGIN
                //Employee."Contract Type":= "Contract Type";
                //Employee.MODIFY;
                //END;
            end;
        }
        field(11; Status; Option)
        {
            OptionMembers = Active,Inactive,Terminated;

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee.Status := Status;
                    Employee.Modify;
                end;
            end;
        }
        field(12; "Last Name"; Text[30])
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Last Name" := "Last Name";
                    Employee.Modify;
                end;
            end;
        }
        field(13; Title; Option)
        {
            OptionMembers = Mr,Mrs,Miss,Dr;

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee.Title := Title;
                    Employee.Modify;
                end;
            end;
        }
        field(14; Appraisal; Boolean)
        {

            trigger OnValidate()
            begin
                AppraisalRec.SetRange(AppraisalRec."Employee No", "Employee No.");
                OK := AppraisalRec.Find('+');
                if OK then begin
                    AppraisalRec.Date := "Date Of Event";
                    AppraisalRec.Modify;
                end;
            end;
        }
        field(15; "Exit Interview"; Boolean)
        {

            trigger OnValidate()
            begin
                //  ExitRec.SETRANGE("Employee No.","Employee No.");
                //  OK:= ExitRec.FIND('+');
                if Employee.Get("Employee No.") then begin
                    Employee."Exit Interview Date" := "Date Of Event";
                    Employee.Modify;
                end;
            end;
        }
        field(16; Grievance; Boolean)
        {

            trigger OnValidate()
            begin
                /*
                GrievanceRec.SETRANGE("Employee No.","Employee No.");
                OK:= GrievanceRec.FIND('+');
                IF OK THEN BEGIN
                  GrievanceRec."Release Date":= "Date Of Event";
                  GrievanceRec.MODIFY;
                END;
                 */

            end;
        }
        field(17; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly;
        }
        field(18; "Medical Aid Number"; Text[80])
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Medical Scheme No." := "Medical Aid Number";
                    Employee.Modify;
                end;
            end;
        }
        field(19; "Vehicle Registration"; Code[10])
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Vehicle Registration Number" := "Vehicle Registration";
                    Employee.Modify;
                end;
            end;
        }
        field(20; "Marital Status"; Option)
        {
            OptionMembers = Single,Married,Separated,Divorced,"Widow(er)",Other;

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Marital Status" := "Marital Status";
                    Employee.Modify;
                end;
            end;
        }
        field(21; Joined; Boolean)
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Date Of Join" := "Date Of Event";
                    Employee.Modify;
                end;
            end;
        }
        field(22; "Employee First Name"; Text[30])
        {
        }
        field(23; "Employee Last Name"; Text[30])
        {
        }
        field(24; "Disciplinary Date"; Date)
        {
        }
        field(25; Disciplinary; Boolean)
        {
        }
        field(26; Comment; Boolean)
        {
            CalcFormula = exist("HR Human Resource Comments1" where("Table Name" = const("Career History"),
                                                                     "No." = field("Employee No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; Reason; Text[100])
        {
        }
        field(28; "Line No."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        OK := Employee.Get("Employee No.");
        if OK then begin
            "Employee First Name" := Employee."Known As";
            "Employee Last Name" := Employee."Last Name";
            //LinkDocs.Division := 'Correspondance History';
        end;
    end;

    var
        Employee: Record "HR Employee1";
        AppraisalRec: Record "Employee Appraisals1";
        OK: Boolean;
        EmployeeRec: Record Employee;


    procedure GetEmployeeInfo()
    begin
        Employee.SetRange("No.", "Employee No.");
        OK := Employee.Find('-');
        if OK then begin
            if ("Last Name" = '') then
                "Last Name" := 'NO CHANGE';
            if (Department = '') then
                Department := 'NO CHANGE';
            if (Directorate = '') then
                Directorate := 'NO CHANGE';
            if ("Job Title" = '') then
                "Job Title" := 'NO CHANGE';
            if (Location = '') then
                Location := 'NO CHANGE';
            if (("Full/Part Time" = 0) and (Employee."Full / Part Time" = 0)) or ("Full/Part Time" <> Employee."Full / Part Time")
   then
                "Full/Part Time" := Employee."Full / Part Time";
            //IF "Contract Type" <> Employee."Contract Type" THEN
            //"Contract Type":= Employee."Contract Type";
            if ((Status = 0) and (Employee.Status = 0)) or (Status <> Employee.Status) then
                Status := Employee.Status;
            if ((Title = 0) and (Employee.Title = 0)) or (Title <> Employee.Title) then
                Title := Employee.Title;
            if (("Marital Status" = 0) and (Employee."Marital Status" = 0)) or ("Marital Status" <> Employee."Marital Status") then
                "Marital Status" := Employee."Marital Status";
            if ("Medical Aid Number" = '') then
                "Medical Aid Number" := 'NO CHANGE';
            if ("Vehicle Registration" = '') then
                "Vehicle Registration" := 'NO CHANGE';

            /*
             IF (Pay = 0.00) THEN BEGIN
                 PayHistory.SETRANGE("Employee No.","Employee No.");
                 OK:= PayHistory.FIND('+');
                 IF OK THEN BEGIN
                   Pay:= PayHistory.Pay;
                  "Pay Period":= PayHistory."Pay Period";
                 END;
              END;
              */
        end;

    end;
}

