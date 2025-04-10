page 50338 "Copy ScoreCard"
{
    Caption = 'Copy ScoreCard';
    PageType = StandardDialog;
    layout
    {
        area(content)
        {
            group("Copy from")
            {
                Caption = 'Copy from';
                field(SourceContractNo; ContractNo)
                {
                    Editable = false;
                    Caption = 'Source Contract No.';
                    ApplicationArea = All;
                }
                field(SourceEmployeeNo; EmployeeNo)
                {
                    Editable = false;
                    Caption = 'Source Employee No.';
                    ApplicationArea = All;
                }
                field(CopyLines; CopyLines)
                {
                    Caption = 'Copy Lines';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        ValidateSource();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        TargetPCH: Record "Perfomance Contract Header";
    begin
        if CloseAction in [ACTION::OK, ACTION::LookupOK] then begin
            ValidateUserInput();
            CopyPerformanceContractHeader();
        end

    end;

    var
        ContractNo: Code[50];
        EmployeeNo: Code[50];
        CopyLines: Boolean;
        Text001: Label 'The job no. %1 was successfully copied to the new job no. %2 with the status %3.', Comment = '%1 - The "No." of source job; %2 - The "No." of target job, %3 - job status.';
        Text002: Label 'Job No. %1 will be assigned to the new Job. Do you want to continue?';
        Text003: Label '%1 %2 does not exist.', Comment = 'Job Task 1000 does not exist.';

    local procedure ValidateUserInput()
    var
        JobsSetup: Record "Jobs Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin

    end;

    local procedure ValidateSource()
    begin
        /* case true of
             Source = Source::"Job Planning Lines":
                 begin
                     PlanningLineTypeEnable := true;
                     LedgerEntryLineTypeEnable := false;
                 end;
             Source = Source::"Job Ledger Entries":
                 begin
                     PlanningLineTypeEnable := false;
                     LedgerEntryLineTypeEnable := true;
                 end;
             Source = Source::None:
                 begin
                     PlanningLineTypeEnable := false;
                     LedgerEntryLineTypeEnable := false;
                 end;
         end;*/
    end;

    procedure SetFromContractHeader(SourcePCH: Record "Perfomance Contract Header")
    begin
        ContractNo := SourcePCH.No;
        EmployeeNo := SourcePCH."Responsible Employee No.";
    end;

    procedure CopyPerformanceContractHeader()
    var
        PerfomanceContrHdr: Record "Perfomance Contract Header";
        NewPerfomanceContrHdr: Record "Perfomance Contract Header";
        PCObjective: Record "PC Objective";
        NewPCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        NewSecondaryPCObjective: Record "Secondary PC Objective";
        PCJobDesc: Record "PC Job Description";
        NewPCJobDesc: Record "PC Job Description";
    begin
        if PerfomanceContrHdr.Get(ContractNo) then begin

            NewPerfomanceContrHdr.Init();
            NewPerfomanceContrHdr.TransferFields(PerfomanceContrHdr);
            NewPerfomanceContrHdr.No := '';
            NewPerfomanceContrHdr."Approval Status" := NewPerfomanceContrHdr."Approval Status"::Open;
            NewPerfomanceContrHdr.Status := NewPerfomanceContrHdr.Status::" ";
            NewPerfomanceContrHdr."Change Status" := NewPerfomanceContrHdr."Change Status"::Open;
            NewPerfomanceContrHdr.Insert(true);
            if CopyLines then begin

                PCObjective.Reset;
                PCObjective.SetRange("Workplan No.", PerfomanceContrHdr.No);
                PCObjective.SetRange("Strategy Plan ID", PerfomanceContrHdr."Strategy Plan ID");
                if PCObjective.FindSet then
                    repeat
                        NewPCObjective.Init;
                        NewPCObjective.TransferFields(PCObjective);
                        NewPCObjective."Workplan No." := NewPerfomanceContrHdr.No;
                        NewPCObjective."Strategy Plan ID" := NewPerfomanceContrHdr."Strategy Plan ID";
                        NewPCObjective.Insert;
                    until PCObjective.Next = 0;

                SecondaryPCObjective.Reset;
                SecondaryPCObjective.SetRange("Workplan No.", PerfomanceContrHdr.No);
                SecondaryPCObjective.SetRange("Strategy Plan ID", PerfomanceContrHdr."Strategy Plan ID");
                if SecondaryPCObjective.FindSet() then
                    repeat
                        NewSecondaryPCObjective.Init;
                        NewSecondaryPCObjective.TransferFields(SecondaryPCObjective);
                        NewSecondaryPCObjective."Workplan No." := NewPerfomanceContrHdr.No;
                        NewSecondaryPCObjective."Strategy Plan ID" := NewPerfomanceContrHdr."Strategy Plan ID";
                        NewSecondaryPCObjective.Insert();
                    until SecondaryPCObjective.Next() = 0;

                PCJobDesc.Reset;
                PCJobDesc.SetRange("Workplan No.", PerfomanceContrHdr.No);
                if PcJobDesc.FindSet then
                    repeat
                        NewPCJobDesc.Init;
                        NewPCJobDesc.TransferFields(PcJobDesc);
                        NewPCJobDesc."Workplan No." := NewPerfomanceContrHdr.No;
                        NewPCJobDesc.Insert();
                    until PcJobDesc.Next = 0;

            end;

            if Confirm('New Scorecard No %1 has been created successfully, do you want to open it?', false, NewPerfomanceContrHdr.No) then
                Page.Run(Page::"Individual Scorecard", NewPerfomanceContrHdr);
        end;
    end;

}


