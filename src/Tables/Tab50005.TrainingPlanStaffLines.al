table 50433 "Training Plan Staff Lines"
{
    Caption = 'Training Plan Staff Lines';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Training Plan Staff Lines";
    LookupPageId = "Training Plan Staff Lines";

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(2; "Training Plan Code"; Code[30])
        {
            Caption = 'Training Plan Code';
            TableRelation = "Training Plan Header".No;
        }
        field(3; "Task No"; Integer)
        {
            Caption = 'Task No';
            TableRelation = "Training Plan Lines"."Task No";
        }
        field(4; "Year Code"; Code[50])
        {
            Caption = 'Year Code';
        }
        field(5; "Course Title"; Code[30])
        {
            Caption = 'Course Title';
            TableRelation = "Training Courses Setup".Code;
        }
        field(6; "Employee Code"; Code[20])
        {
            Caption = 'Employee Code';
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if HRemp.Get("Employee Code") then
                    "Employee Name" := HRemp.FullName();
            end;
        }
        field(7; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(8; "Type"; Code[100])
        {
            Caption = 'Type';
            TableRelation = "Receipts and Payment Types1" /* where(Type = filter(Imprest)) */;

            trigger OnValidate()
            begin
                if AdvanceTypes.Get(Type) then
                    "G/l Account" := AdvanceTypes."G/L Account";
            end;
        }
        field(9; Destination; Code[100])
        {
            Caption = 'Destination';
            TableRelation = "Work Type".Code;
        }
        field(10; "No. of Days"; Integer)
        {
            Caption = 'No. of Days';
            trigger OnValidate()
            begin
                // TrainingRequests.Reset;
                // TrainingRequests.SetRange(Code, "Training Code");
                // if TrainingRequests.FindSet then begin
                //     if TrainingRequests."Training Venue Region Code" <> '' then begin
                //         if Destination <> TrainingRequests."Training Venue Region Code" then
                //             Error(TXT002, TrainingRequests."Training Venue Region Code");
                //     end;
                // end;
                HumanResourcesSetup.Get;
                if ResourceRec.Get("Employee Code") then begin
                    ResourceRec.Reset;
                    ResourceRec.SetRange("No.", "Employee Code");
                    if ResourceRec.FindSet then begin
                        ResourceCost.Reset();
                        ResourceCost.SetRange(Code, ResourceRec."No.");
                        ResourceCost.SetRange("Work Type Code", Destination);
                        if ResourceCost.FindSet then begin
                            "Unit Amount" := ResourceCost."Direct Unit Cost";
                            "Total Amount" := "No. of Days" * ResourceCost."Direct Unit Cost";
                        end;
                    end;
                end

            end;
        }
        field(11; "Unit Amount"; Decimal)
        {
            Caption = 'Unit Amount';
            Editable = false;
        }
        field(12; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
        }
        field(13; "G/l Account"; Code[30])
        {
        }
    }
    keys
    {
        key(PK; "Line No.", "Training Plan Code", "Task No", "Year Code", "Course Title", "Employee Code")
        {
            Clustered = true;
        }
    }

    var
        HRemp: Record Employee;
        ResourceRec: Record Resource;
        ResourceCost: Record "Resource Cost";
        AdvanceTypes: Record "Receipts and Payment Types1";
        PlanningLineEntry: Record "Training Plan Lines";
        TrainingRequests: Record "Training Requests";
        TXT001: label 'The training course %1,is only allowed for the job group %2';
        TXT002: label 'The destination selected is not in the training region selected,Kindly select %1';
        WorkType: Record "Work Type";
        HumanResourcesSetup: Record "Human Resources Setup";
}
