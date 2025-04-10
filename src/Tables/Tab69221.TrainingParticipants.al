
table 69221 "Training Participants1"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Employee Code"; Code[30])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                TrainingNeed: Record "Job Advert Header";
                Header: Record "Training Requests";
            begin
                HRemp.Reset;
                if HRemp.Get("Employee Code") then begin
                    "Employee Name" := HRemp."First Name" + ' ' + HRemp."Middle Name" + ' ' + HRemp."Last Name";
                    "Job Title" := HRemp."Job Title";
                    "Job Description" := HRemp."Job ID";
                    "Global Dimension 1 Code" := HRemp."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := HRemp."Global Dimension 2 Code";
                    ResourceRec.Reset;
                    ResourceRec.SetRange("No.", HRemp."No.");
                    if ResourceRec.FindSet then begin
                        //***********Added to validate job group

                        TrainingRequests.Reset;
                        TrainingRequests.SetRange(Code, "Training Code");
                        if TrainingRequests.FindSet then begin
                            PlanningLineEntry.Reset;
                            PlanningLineEntry.SetRange("Training Plan Code", TrainingRequests.Code);
                            PlanningLineEntry.SetRange("Course Title", TrainingRequests."Course Title");
                            if PlanningLineEntry.FindSet then begin
                                repeat
                                    if PlanningLineEntry."Target Group Code" <> '' then begin
                                        if PlanningLineEntry."Target Group Code" <> ResourceRec."Resource Group No." then
                                            Error(TXT001, TrainingRequests."Course Title", PlanningLineEntry."Target Group Code");
                                    end;
                                until PlanningLineEntry.Next = 0
                            end;
                        end;
                        //CHECK THE RC
                        "Training Responsibility Code" := TrainingRequests."Global Dimension 1 Code";
                        Destination := TrainingRequests."Training Venue Region Code";
                        if "Training Responsibility Code" <> "Global Dimension 1 Code" then
                            "Pay Per Diem" := true;
                    end;

                end;
                Header.Reset();
                Header.SetRange(Code, Rec."Training Code");
                if Header.FindFirst() then
                    Header.Validate("No. of Participants");
            end;
        }
        field(3; "Employee Name"; Text[60])
        {
        }
        field(4; Objectives; Text[100])
        {
        }
        field(5; "Training Code"; Code[20])
        {
        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(7; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(8; "Job Title"; Code[30])
        {
            TableRelation = "ManPower Planning Lines";
        }
        field(9; "Job Description"; Text[100])
        {
            CalcFormula = lookup(Positions."Job Description" where("Job ID" = field("Job Title")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; Bonded; Boolean)
        {
        }
        field(11; Destination; Code[100])
        {
            //TableRelation = Location;
            TableRelation = "Work Type".Code;
        }
        field(12; "No. of Days"; Integer)
        {

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
                        ResourceCost.SetRange(Code, ResourceRec."No.");
                        ResourceCost.SetRange("Work Type Code", Destination);
                        if ResourceCost.FindSet then begin
                            "Unit Amount" := ResourceCost."Direct Unit Cost";
                            "Total Amount" := "No. of Days" * ResourceCost."Direct Unit Cost";
                        end;

                        /* IF ("Global Dimension 1 Code"=HumanResourcesSetup."HQ Responsibility Center")AND("Training Responsibility Code"=HumanResourcesSetup."HQ Region RC")
                            THEN BEGIN

                              "Total Amount":=0;
                          END ELSE
                        IF ("Global Dimension 1 Code"=HumanResourcesSetup."HQ Region RC")AND("Training Responsibility Code"=HumanResourcesSetup."HQ Responsibility Center")
                            THEN BEGIN
                             "Total Amount":=0;
                        END ELSE
                             IF "Training Responsibility Code"<>"Global Dimension 1 Code" THEN BEGIN
                               "Total Amount":="Unit Amount"*"No. of Days";
                         END;
                         */

                    end;
                end

            end;
        }
        field(13; "G/l Account"; Code[30])
        {
        }
        field(14; "Unit Amount"; Decimal)
        {
        }
        field(15; "Total Amount"; Decimal)
        {
        }
        field(16; Type; Code[100])
        {
            TableRelation = "Receipts and Payment Types1" /* where(Type = filter(Imprest)) */;

            trigger OnValidate()
            begin
                if AdvanceTypes.Get(Type) then
                    "G/l Account" := AdvanceTypes."G/L Account";
            end;
        }
        field(17; "Requisition Created"; Boolean)
        {
        }
        field(18; "Start Date"; Date)
        {
        }
        field(19; "End Date"; Date)
        {
        }
        field(20; "Memo Id"; Code[30])
        {
        }
        field(21; "Pay Per Diem"; Boolean)
        {
        }
        field(22; "Training Responsibility Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1), Blocked = const(false));
        }
        field(23; "Training Responsibility"; Text[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Training Responsibility Code")));
            FieldClass = FlowField;
        }
        field(24; Requestor; Text[50])
        {
            Editable = false;
        }
        field(25; Witness; Code[20])
        {
            trigger OnValidate()
            begin
                HREmp.Reset();
                if HREmp.Get(Witness) then
                    "Witness Name" := HREmp.FullName();
            end;
        }
        field(26; "Witness Name"; Text[100])
        {
            Editable = false;
        }
        field(27; "Bond Penalty"; Decimal)
        {
        }
        field(28; "Bond End Date"; Date)
        {
        }
        field(29; "Charge Levy"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Line No", "Training Code", "Employee Code", "Training Responsibility Code")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }
    trigger OnInsert()
    begin
        CheckTrainingLevy();
    end;

    local procedure CheckTrainingLevy()
    var
        LeaveTypes: Record "HR Leave Types";
        TotDays: Integer;
    begin
        LeaveTypes.Reset();
        LeaveTypes.SetRange("Posting Type", LeaveTypes."Posting Type"::"Study Leave");
        if LeaveTypes.FindFirst() then begin
            if LeaveTypes.Days = 0 then
                exit;
            TrainingRequests.Reset();
            if TrainingRequests.Get(Rec."Training Code") then begin
                TotDays := TrainingRequests."End Date" - TrainingRequests."Start Date";
                if TotDays < LeaveTypes.Days then
                    exit;
                "Charge Levy" := true;
            end;
        end;
    end;

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
    //IanCasper
    procedure CalculateTrainingLevy(dtOpenPeriod: Date; strEmpCode: Code[50])
    var
        TrainingParticipants: Record "Training Participants1";
        EmpTransactions: Record "PR Employee Transactions";
        PRSetup: Record "PR Vital Setup Info";
        TrainingRequest: Record "Training Requests";
    begin
        TrainingParticipants.Reset();
        TrainingParticipants.SetRange("Employee Code", strEmpCode);
        TrainingParticipants.SetRange("Charge Levy", true);
        TrainingParticipants.SetRange("Start Date", dtOpenPeriod, CalcDate('CM', dtOpenPeriod));
        if TrainingParticipants.FindFirst() then begin
            TrainingRequest.Get(TrainingParticipants."Training Code");
            if TrainingRequest.Status <> TrainingRequest.Status::Approved then
                exit;
            if CalcDate('CM', dtOpenPeriod) <> CalcDate('CM', TrainingParticipants."Start Date") then
                exit;
            PRSetup.Get();
            PRSetup.TestField("Int. Training Levy");
            PRSetup.TestField("Local Training Levy");

            EmpTransactions.Init;
            EmpTransactions."Employee Code" := strEmpCode;
            EmpTransactions."Reference No" := TrainingParticipants."Training Code";
            if TrainingRequest."Training Region" = TrainingRequest."Training Region"::Overseas then
                EmpTransactions.Validate("Transaction Code", PRSetup."Int. Training Levy")
            else
                EmpTransactions.Validate("Transaction Code", PRSetup."Local Training Levy");
            EmpTransactions."Payroll Period" := dtOpenPeriod;
            EmpTransactions."Period Month" := Date2DMY(dtOpenPeriod, 2);
            EmpTransactions."Period Year" := Date2DMY(dtOpenPeriod, 3);
            EmpTransactions."Start Date" := TrainingParticipants."Start Date";
            if not EmpTransactions.Insert then EmpTransactions.Modify();
        end;

    end;

}

