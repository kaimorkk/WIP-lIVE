

page 69195 "Training Plan Header"
{
    PageType = Card;
    SourceTable = "Training Plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                //Editable = Status;
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Training"; Rec."Internal Training")
                {
                    ApplicationArea = Basic;
                    Caption = 'Internal Training Estimated Cost';
                    Editable = false;
                    Visible = false;

                }
                field("External Training"; Rec."External Training")
                {
                    ApplicationArea = Basic;
                    Caption = 'External Training Estimated Cost';
                    Editable = false;
                    Visible = false;
                }
                field("Total Estimated Cost"; Rec."Total Estimated Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bugdet Available"; Rec."Bugdet Available")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Allocation';
                    Editable = false;
                }
                field("Budget Allocation"; Rec."Budget Allocation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Available';
                    Editable = false;
                }
                field("Budget Utilized"; Rec."Budget Utilized")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approved Status"; Rec."Approved Status")
                {
                    ApplicationArea = Basic;
                    Caption = ' Status';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control16; "Training Plan Lines")
            {
                Enabled = Status;
                SubPageLink = "Training Plan Code" = field(No), "Year Code" = field("Year Code");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Requests")
            {
                ApplicationArea = Basic;
                Caption = 'Import Needs Requests';
                Image = Approvals;
                Visible = false;

                trigger OnAction()
                var
                    PlanningLines: Record "Training Plan Lines";
                    RequestHeader: Record "Training Needs Header";
                    ReqLines: Record "Training Needs Requests";
                    Courses: Record "Training Courses Setup";
                begin
                    if not Confirm('Do you want to import Request Lines. Any prepopulated lines will be overwritten') then
                        exit;
                    PlanningLines.Reset();
                    PlanningLines.SetRange("Training Plan Code", Rec.No);
                    PlanningLines.DeleteAll();


                    RequestHeader.Reset();
                    // RequestHeader.SetRange("Training Plan No", Rec.No);
                    RequestHeader.SetRange(Status, RequestHeader.Status::Released);

                    if RequestHeader.FindSet() then
                        repeat

                            ReqLines.Reset();
                            // ReqLines.SetRange("Training Header No.", RequestHeader.Code);
                            if ReqLines.FindSet() then begin
                                PlanningLines.Init();
                                Message('Confirming if this works');
                                PlanningLines."Course Title" := ReqLines."Course ID";
                                PlanningLines."Course Description" := ReqLines.Description;
                                if Courses.Get(PlanningLines."Course Title") then begin
                                    PlanningLines."Course Duration" := Format(Courses."Course Duration");
                                    PlanningLines."Proposed Course Provider" := Courses.Trainer;
                                    PlanningLines."Proposed Course Provider Name" := Courses."Trainer Name";
                                end;
                                PlanningLines."Training Plan Code" := Rec.No;
                                PlanningLines."Planned No. of Staff" := ReqLines.Count;
                                PlanningLines.Insert();
                            end;

                        until RequestHeader.Next = 0;

                end;
            }

            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    docu: enum "Approval Document Type";
                begin
                    Docu := Docu::"Training Plan";
                    ApprovalEntries.SetRecordFilters(Database::"Training Plan Header", docu, Rec.No);
                    ApprovalEntries.Run;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    if Confirm('Do you want to send training plan for approval?') then begin
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                    end
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;

                trigger OnAction()
                begin
                    Rec.TestField("Approved Status", Rec."approved status"::"Pending Approval");
                    if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                    VarVariant := Rec;
                    //if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);

                end;
            }
            action("Re-Open")
            {
                ApplicationArea = Basic;
                Caption = 'Re-Open';
                Image = ReopenCancelled;
                Visible = false;

                trigger OnAction()
                begin
                    Rec."Approved Status" := Rec."approved status"::Open;
                    Rec.Modify(true);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(69145, true, false, Rec);
                end;
            }
            action(Calendar)
            {
                ApplicationArea = Basic;
                Image = "Report";

                trigger OnAction()
                begin
                    // Rec.SetRange(No, Rec.No);
                    // Report.Run(Report::"Training Calendar", true, false, Rec);
                end;
            }
            action("Suggest Costs and Applicants")
            {
                ApplicationArea = Basic;
            }
        }
        area(processing)
        {
            action("Training Plan Goals")
            {
                ApplicationArea = Basic;
                Image = Planning;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Training Goal Setup";
                RunPageLink = "Training Plan ID" = field(No);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Import Requests_Promoted"; "Import Requests")
                {
                }
                actionref("&Approvals_Promoted"; "&Approvals")
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref("Re-Open_Promoted"; "Re-Open")
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Calendar_Promoted; Calendar)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Status := true;
        if Rec."Approved Status" = Rec."approved status"::"Pending Approval" then
            Status := false else
            Status := true;
    end;

    var
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        Status: Boolean;

    local procedure SuggestCosts(TrainingNeed: Record "Job Advert Header")
    var
        TrainingCost: Record "Training Cost";
    begin
    end;

    local procedure SuggestParticipants()
    begin
    end;
}

#pragma implicitwith restore

