
table 69200 "HR Disciplinary Cases"
{
    DrillDownPageID = "HR Disciplinary Cases SF";
    LookupPageID = "HR Disciplinary Cases SF";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Case Number"; Code[20])
        {
            Editable = false;
        }
        field(3; "Date of Complaint"; Date)
        {
            Caption = 'Date of Reporting';

        }
        field(4; "Type of Disciplinary Case"; Code[70])
        {
            Caption = 'Nature of the case';
            NotBlank = true;
            TableRelation = if (Type = const(Disciplinary)) "HR Models".Code where(Type = const("Disciplinary Case"))
            else
            if (Type = const(Grievance)) "HR Models".Code where(Type = const("Grievance Cause"));

            trigger OnValidate()
            begin
                HRModels.Reset;
                HRModels.SetRange(Code, "Type of Disciplinary Case");
                if HRModels.FindSet then begin
                    "Case Description" := HRModels.Description;
                end;
            end;
        }
        field(5; "Recommended Action"; Code[20])
        {
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Action"));
        }
        field(6; "Case Description"; Text[2000])
        {
        }
        field(7; Accuser; Code[10])
        {
            Caption = 'Originator';
            TableRelation = if ("Accuser Is Staff" = const(true)) Employee."No.";
        }
        field(8; "Witness #1"; Code[20])
        {
            TableRelation = if ("Witness#1 Staff" = const(true)) Employee."No.";
        }
        field(9; "Witness #2"; Code[20])
        {
            TableRelation = if ("Witness#2 Staff" = const(true)) Employee."No.";
        }
        field(10; "Action Taken"; Code[20])
        {
            TableRelation = if (Type = const(Disciplinary)) "Disciplinary Status Table"."Disciplinary Status"
            else
            if (Type = const(Grievance)) "HR Models".Code where(Type = const("Grievance Outcome"));

            trigger OnValidate()
            begin
                DisciplinaryStatusTable.Reset;
                DisciplinaryStatusTable.SetRange("Disciplinary Status", "Action Taken");
                if DisciplinaryStatusTable.FindSet then
                    "HR/Payroll Implications" := DisciplinaryStatusTable."Deduction Code";
            end;
        }
        field(11; "Date To Discuss Case"; Date)
        {
        }
        field(12; "Document Link"; Text[200])
        {
        }
        field(13; "Disciplinary Remarks"; Code[2000])
        {
        }
        field(14; Comments; Text[250])
        {
        }
        field(15; "Case Discussion"; Boolean)
        {
        }
        field(16; "Body Handling The Complaint"; Code[250])
        {
            Caption = 'Body Handling The Case';
            TableRelation = "HR Discplinary Bodies".Code;
        }
        field(17; Recomendations; Code[250])
        {
        }
        field(18; "HR/Payroll Implications"; Code[20])
        {
        }
        field(19; "Support Documents"; Option)
        {
            OptionMembers = Yes,No;
        }
        field(20; "Policy Guidlines In Effect"; Text[2000])
        {
        }
        field(21; Status; Option)
        {
            OptionMembers = Open,Submitted,Closed,Appealed;
        }
        field(22; "Mode of Lodging the Complaint"; Code[20])
        {
            Caption = 'Mode of Lodging the Case';
            TableRelation = "Mode of Lodging Case".Code;
        }
        field(23; "No. Series"; Code[20])
        {
        }
        field(24; "Employee No"; Code[30])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()

            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then begin
                    "Employee Name" := Employee.FullName();
                    Designation := Employee."Job Title";
                    Validate("Duty Station", Employee."Current Duty Station");

                    if Employee."Job Title2" <> '' then
                        Designation := Employee."Job Title2";
                end;
            end;
        }
        field(25; Selected; Boolean)
        {
        }
        field(26; "Closed By"; Code[100])
        {
        }
        field(27; "Case Severity"; Option)
        {
            Caption = 'Category of Discipline Case';
            OptionCaption = ' ,Misconduct,Gross Misconduct';
            OptionMembers = " ",Misconduct,"Gross Misconduct";
        }
        field(28; "Handled By"; Option)
        {
            OptionCaption = ',HCA,HOD/HOU,Committee,Court,Board';
            OptionMembers = ,HCA,"HOD/HOU",Committee,Court,Board;
        }
        field(29; "Disciplinary Commitee"; Code[30])
        {
            Caption = 'Commitee Membership';
            TableRelation = "Commitee Appointment Voucher"."Document No.";

            trigger OnValidate()
            begin
                // IF "Handled By"<>"Handled By"::Committee THEN BEGIN
                //  ERROR('Handled by must be a committee for you to specify committee');
                //  END;
            end;
        }
        field(30; "Employee Name"; Text[100])
        {
        }
        field(31; "Created By"; Code[50])
        {
        }
        field(32; "Document Date"; Date)
        {
        }
        field(33; "Non Staff Witness #1"; Text[250])
        {

            trigger OnValidate()
            begin
                if "Witness#1 Staff" = true then
                    Error('Witness # 1 must not be a member of staff');
            end;
        }
        field(34; "Non Staff Witness #2"; Text[250])
        {

            trigger OnValidate()
            begin
                if "Witness#2 Staff" = true then
                    Error('Witness # 2 must not be a member of staff');
            end;
        }
        field(35; "Non Staff Originator"; Text[250])
        {

            trigger OnValidate()
            begin
                if "Accuser Is Staff" = true then
                    Error('Originator must not be a member of staff');
            end;
        }
        field(3963; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = const(false), "Operating Unit Type" = filter(Directorate | "Court Stations" | "Department/Center" | "Division/Section" | Office));
            Caption = 'Duty Station';
            trigger OnValidate()
            var
                RespC: Record "Responsibility Center";
            begin
                if RespC.get("Responsibility Center") then
                    "Implementing Unit Name" := RespC.Name;
            end;
        }
        field(3964; "Accuser Is Staff"; Boolean)
        {
            Caption = 'Originator Is Staff';
        }
        field(3965; "Witness#1 Staff"; Boolean)
        {
        }
        field(3966; "Witness#2 Staff"; Boolean)
        {
        }
        field(3967; "Disciplinary status"; Code[30])
        {
            TableRelation = "Disciplinary Status Table"."Disciplinary Status";
        }
        field(3968; "Case Created"; Boolean)
        {
        }
        field(3969; "Legal Case No."; Code[30])
        {
            TableRelation = "Case Register"."No.";
        }
        field(3970; "Legal Case Recommendation"; Text[250])
        {
            CalcFormula = lookup("Case Register"."Verdict Summary" where("No." = field("Legal Case No.")));
            FieldClass = FlowField;
        }
        field(3971; Brief; Text[250])
        {
        }
        field(3972; "Disciplinary Case Type"; Option)
        {
            OptionCaption = ',New,Appeal';
            OptionMembers = ,New,Appeal;
        }
        field(3973; "End Date"; Date)
        {
        }
        field(3974; Type; Option)
        {
            OptionCaption = ',Disciplinary,Grievance';
            OptionMembers = ,Disciplinary,Grievance;
        }
        field(3975; "Appealed case No"; Code[20])
        {
        }
        field(3976; "Period From"; Date)
        {

        }
        field(3977; "Period To"; Date)
        {

        }
        field(3978; "Previous Interventions"; Text[250])
        {

        }
        field(3980; Designation; Text[250])
        {
            Editable = false;
        }
        field(3981; "Date Submitted"; Date)
        {
            Editable = false;
        }
        field(3982; "Time Submitted"; Time)
        {
            Editable = false;
        }
        field(3983; "Submitted By"; Code[50])
        {
            Editable = false;
        }
        field(3984; "Has Multiple Accused Employees"; Boolean)
        {
        }

        field(3985; "Supervisor Remarks"; Text[250])
        {
        }
        field(3986; "Disciplinary Officer In Charge"; Code[20])
        {
            // TableRelation = Employee where("Is Part Of Disciplinary Team" = const(true));
            // trigger OnValidate()
            // var
            //     Emp: Record Employee;
            //     AssignQuery: Label 'Sure to assign, case %1 to %2 ?';
            //     CaseAssignedSub: Label 'Discipline Case %1, Assignment';
            //     DisciplineBody: Label '<p> You have been assigned case no <b>%1</b>,<br> Case Description: <b>%2</b></p>';
            //     Salutation: Label 'Greetings <b>%1</b>,';
            //     VehicleMgt: Codeunit "Vehicle Management";
            // begin
            //     if not Confirm(AssignQuery, false, "Case Number" + ' ' + "Case Description", "Employee Name") then
            //         Error('Action Stopped by User!');
            //     Emp.Get("Disciplinary Officer In Charge");
            //     "Disciplinary Officer Name" := Emp.FullName();
            //     VehicleMgt.SendEmail(Emp."E-Mail", '', StrSubstNo(CaseAssignedSub, "Case Number"), StrSubstNo(Salutation, Emp."First Name"),
            //     StrSubstNo(DisciplineBody, "Case Number", "Case Description"));
            // end;
        }
        field(3987; "Disciplinary Officer Name"; Text[100])
        {
            Editable = false;
            Caption = 'Disciplinary Officer In Charge Name';
        }

        field(3988; "Creator Job Title"; Text[100])
        {
            Editable = false;
        }
        field(3989; "Date of Latest Action"; Date)
        {
        }
        field(3990; "Case Duration"; Duration)
        {

        }
        field(70092; "Implementing Unit Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Duty Station Name';
        }
        field(3991; "Case Stage"; Text[100])
        {
            fieldclass = Flowfield;
            CalcFormula = lookup("Discipline Details"."Document Stage" where("Discipline Case No." = field("Case Number")));
        }
        field(3992; "Case Outcome"; Text[100])
        {
            fieldclass = Flowfield;
            CalcFormula = lookup("Discipline Details"."Document Stage Description" where("Discipline Case No." = field("Case Number")));

        }
        field(3993; "Duty Station"; Code[30])
        {
            Editable = false;
            trigger OnValidate()
            var
                DutyStation: Record "Duty Station";
            begin
                if DutyStation.Get(DutyStation) then
                    "Duty Station Name" := DutyStation.Description;
            end;
        }
        field(3994; "Duty Station Name"; Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }


    }

    keys
    {
        key(Key1; "Employee No", "Case Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Case Number" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Disciplinary Cases Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Disciplinary Cases Nos.", xRec."No. Series", 0D, "Case Number", "No. Series");
            "Case Number" += Format(Today, 0, '.<Month,2>.<Year4>');
        end;
        "Document Date" := Today;
        "Created By" := UserId;

        UserSetup.Get(UserId);

        Employee.Reset;
        Employee.SetRange(Employee."No.", UserSetup."Employee No.");
        Employee.SetRange(HOD, true);
        Employee.FindFirst();

        "Creator Job Title" := Employee."Job Title";
        if Employee."Job Title2" <> '' then
            "Creator Job Title" := Employee."Job Title2";

    end;

    trigger OnModify()
    begin
        // IF Status=Status::Submitted THEN
        //   ERROR('You cannot modify a closed case');
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRModels: Record "HR Models";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        DisciplinaryStatusTable: Record "Disciplinary Status Table";
}

