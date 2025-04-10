

page 69166 "Completed Planning Card"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Job Advert Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                // field("Category Code"; "Category Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Category Code field.';
                // }
                // field("Category Description"; "Category Description")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Category Description field.';
                // }
                // field("Cadre Code"; "Cadre Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Cadre Code field.';
                // }
                // field("Cadre Description"; "Cadre Description")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Cadre Description field.';
                // }
                // field("No to be Trained"; "No to be Trained")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No to be Trained field.';
                // }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                // field("Total Cost"; "Total Cost")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Total Cost field.';
                // }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Applications End Time"; Rec."Applications End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications End Time field.';
                }
                // field("Qualification Description"; "Qualification Description")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Qualification Description field.';
                // }
                field("Applications End Date"; Rec."Applications End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications End Date field.';
                }
                field("Applications Start Date"; Rec."Applications Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications Start Date field.';
                }
                field("Company Profile"; Rec."Company Profile")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Profile field.';
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider field.';
                }
                // field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                // }
                // field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                // }
                // field("Responsibility Center"; "Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Responsibility Center field.';
                // }
                field(Test; Rec.Test)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test field.';
                }
            }
            group("Committee Resolution")
            {
                Editable = false;
                // field(Committee; Committee)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Committee field.';
                // }
                // field("Committee Name"; "Committee Name")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Committee Name field.';
                // }
                // field("Prioritized Training"; "Prioritized Training")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Prioritized Training field.';
                // }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("test 2"; Rec."test 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the test 2 field.';
                }
            }
            group(Planning)
            {
                // field("Type of Training"; "Type of Training")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Type of Training field.';
                // }
                // field("Training Dates"; "Training Dates")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Training Dates field.';
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000021; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000022; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("&Plan")
                {
                    ApplicationArea = Basic;
                    Caption = '&Plan';
                    Image = StepInto;
                    Visible = false;
                    ToolTip = 'Executes the &Plan action.';
                    trigger OnAction()
                    begin
                        // "Planned By" := UserId;
                        // Planned := true;
                        // "Date Planned" := Today;
                        // "Time Planned" := Time;
                        Message('Training need :: %1 :: has been Planned', Rec."Requisition No.");
                        Rec.Modify;
                    end;
                }
            }
        }
        area(processing)
        {
            group(ActionGroup22)
            {
                Caption = '&Functions';
                action("Training Costs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Costs';
                    Image = TaskList;
                    RunObject = Page "Training Cost";
                    RunPageLink = "Training ID" = field(Code);
                    Visible = false;
                    ToolTip = 'Executes the Training Costs action.';
                }
                action("Page HR Training Participants List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Participants';
                    RunObject = Page "Training Participants List";
                    RunPageLink = "Training Code" = field(Code);
                    ToolTip = 'Executes the Training Participants action.';
                }
                action("Training Bonding Conditions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Bonding Conditions';
                    Image = BOM;
                    RunObject = Page "Training App Participants List";
                    RunPageLink = "Global Dimension 1 Code" = field(Code);
                    Visible = false;
                    ToolTip = 'Executes the Training Bonding Conditions action.';
                }
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Visible = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation","Overdraft ",BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit;
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := Documenttype::HRNeed;
                        // ApprovalEntries.SetRecordFilters(Database::"Job Advert Header", DocumentType, Rec.Code);
                        ApprovalEntries.Run;
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Visible = false;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    begin
                        if Confirm('Send Approval Request?', true) = false then exit;
                        //AppMgmt.;
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then exit;
                        //AppMgmt.CancelNeedRequest(Rec,TRUE,TRUE);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                actionref("Training Costs_Promoted"; "Training Costs")
                {
                }
                actionref("Training Bonding Conditions_Promoted"; "Training Bonding Conditions")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
                actionref("&Plan_Promoted"; "&Plan")
                {
                }
            }
        }
    }

    // trigger OnAfterGetRecord()
    // begin
    //     UpdateControls;
    // end;

    // trigger OnOpenPage()
    // begin
    //     UpdateControls;
    // end;

    var
        EnableField: Boolean;
        HRTrainingBondingCond: Record "Training Participants";
        AppMgmt: Codeunit "Approvals Mgmt.";
        FieldEditable: Boolean;


    // procedure UpdateControls()
    // begin
    //     if "Budget Controlled" then begin
    //         EnableField := true;
    //     end else begin
    //         EnableField := false;
    //         "G/L Account" := '';
    //         "Expense Code" := '';
    //     end;
    // end;
}

#pragma implicitwith restore

