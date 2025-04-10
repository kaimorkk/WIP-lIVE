Table 80268 "Plan Task Employees"
{

    fields
    {
        field(1; "Performance Mgt Plan ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Management Plan".No;
        }
        field(2; "Employee No"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Department Code" := Employee."Department Code";
                    Validate("Department Code");
                end;

                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindFirst then
                    Employees.Reset;
                Employees.SetRange("No.", UserSetup."Employee No.");
                //Employees.SetRange("Chief Executive Officer",true);
                if not Employees.FindFirst then begin


                    PerformancePlanTask.Reset;
                    PerformancePlanTask.SetRange("Performance Mgt Plan ID", "Performance Mgt Plan ID");
                    //PerformancePlanTask.SETRANGE("Locked Event",TRUE);
                    if PerformancePlanTask.FindSet then begin
                        repeat
                            PlanTaskEmployees.Reset;
                            PlanTaskEmployees.SetRange("Performance Mgt Plan ID", "Performance Mgt Plan ID");
                            // PlanTaskEmployees.SETRANGE("Performance Plan Task ID","Performance Plan Task ID");
                            PlanTaskEmployees.SetRange("Employee No", "Employee No");
                            if PlanTaskEmployees.FindFirst then begin
                                repeat
                                    PPlanTask.Reset;
                                    PPlanTask.SetRange("Performance Mgt Plan ID", PlanTaskEmployees."Performance Mgt Plan ID");
                                    PPlanTask.SetRange("Task Code", PlanTaskEmployees."Performance Plan Task ID");
                                    if PPlanTask.FindFirst then begin
                                        repeat
                                            if (PPlanTask."Processing Start Date" >= PerformancePlanTask."Processing Start Date") and
                                            (PPlanTask."Processing Due Date" <= PerformancePlanTask."Processing Due Date") then
                                                Error('This Employee is already assigned another Event %1', PPlanTask.Description);
                                        until PPlanTask.Next = 0;
                                    end;
                                until PlanTaskEmployees.Next = 0;
                            end;
                        until PerformancePlanTask.Next = 0;
                    end;
                end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Department Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get("Department Code") then begin
                    "Department Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(15; "Department Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; EntryNo; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(17; "Performance Plan Task ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Attendance Status"; Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Invited;
            OptionCaption = 'Invited,Cancelled';
            OptionMembers = Invited,Cancelled;
        }
    }

    keys
    {
        key(Key1; "Performance Mgt Plan ID", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ReviewQuarterlyPeriods: Record "Review Quarterly Periods";
        //Category: Record "Task Category";
        ResponsibilityCenter: Record "Responsibility Center";
        PerformancePlanTask: Record "Performance Plan Task";
        Employee: Record Employee;
        PlanTaskEmployees: Record "Plan Task Employees";
        PPlanTask: Record "Performance Plan Task";
        UserSetup: Record "User Setup";
        Employees: Record Employee;
}

