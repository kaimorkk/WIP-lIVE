

page 69473 "Emergency Drill Log"
{
    PageType = Card;
    SourceTable = "Emergency Drill Log";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Drill ID"; Rec."Drill ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Drill ID field.';
                }
                field("Drill Document Type"; Rec."Drill Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Document Type field.';
                }
                field("OSH Management Plan ID"; Rec."OSH Management Plan ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'OSH Management Plan ID';
                    ToolTip = 'Specifies the value of the OSH Management Plan ID field.';
                }
                field("OSH Plan Calendar ID"; Rec."OSH Plan Calendar ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Plan Calendar ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Evacuation Event ID"; Rec."Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Event ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date of Drill"; Rec."Date of Drill")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date of Drill field.';
                }
                field("Drill Start Time"; Rec."Drill Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Start Time field.';
                }
                field("Drill End Time"; Rec."Drill End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill End Time field.';
                }
                field("Overall Drill Manager ID"; Rec."Overall Drill Manager ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Drill Manager ID field.';
                }
                field("Drill Location Details"; Rec."Drill Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Location Details field.';
                }
                field("Assembly Point Location"; Rec."Assembly Point Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assembly Point Location field.';
                }
                field("Prior Notice to Staff"; Rec."Prior Notice to Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prior Notice to Staff field.';
                }
                field("Notice to Staff Date"; Rec."Notice to Staff Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice to Staff Date field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
            }
            part(Control34; "Emergency Drill Evacuation Lin")
            {
                Caption = 'Drill Findings/Observations';
                SubPageLink = "Drill ID" = field("Drill ID"),
                              "Evacuation Event ID" = field("Evacuation Event ID");
                ApplicationArea = Basic;
            }
            part(Control46; "Emergency Drill Action Plan Li")
            {
                Caption = 'Recommended Action Plan';
                SubPageLink = "Document No." = field("Drill ID"),
                              "Evacuation Event ID" = field("Evacuation Event ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Drill Response Team")
            {
                ApplicationArea = Basic;
                Image = TeamSales;
                RunObject = Page "Emergency Drill Teams";
                RunPageLink = "Drill ID" = field("Drill ID");
                ToolTip = 'Executes the Drill Response Team action.';
            }
            action("Emergency Contacts")
            {
                ApplicationArea = Basic;
                Image = ContactPerson;
                RunObject = Page "Emergency Drill Workgroups";
                RunPageLink = "Drill ID" = field("Drill ID"),
                              "Record Type" = filter("Emergency Response");
                ToolTip = 'Executes the Emergency Contacts action.';
            }
            action("Other Informed Workgroups")
            {
                ApplicationArea = Basic;
                Image = Group;
                RunObject = Page "Emergency Drill Workgroups";
                RunPageLink = "Drill ID" = field("Drill ID"),
                              "Record Type" = filter("To-be Informed");
                ToolTip = 'Executes the Other Informed Workgroups action.';
            }
            action("Drill Evaluation Summary")
            {
                ApplicationArea = Basic;
                Caption = 'Drill Evaluation Summary';
                Image = Sales;
                RunObject = Page "Emergency Drill Ratings";
                RunPageLink = "Document No." = field("Drill ID"),
                              "Evacuation Event ID" = field("Evacuation Event ID");
                ToolTip = 'Executes the Drill Evaluation Summary action.';
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Approval Request has been sent.');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Approval Request has been canceled.');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Approval Request has been sent.');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;

                    Message('Document %1 has been released successfully', Rec."Drill ID");
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;

                    Message('Document %1 has been reopened successfully', Rec."Drill ID");
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                ToolTip = 'Executes the Dimensions action.';
                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Drill ID", Rec."Drill ID");
                    if Rec.FindSet then
                        Report.Run(69454, true, true, Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField(Posted, false);
                    DrillActionPlan.Reset;
                    DrillActionPlan.SetRange("Document No.", Rec."Drill ID");
                    LedgerEntry.Reset;
                    LedgerEntry.SetRange("Source Document No", Rec."Drill ID");
                    if LedgerEntry.FindSet then
                        LedgerEntry.DeleteAll;

                    if DrillActionPlan.FindSet then begin
                        repeat
                            LedgerEntry.Init;
                            LedgerEntry."Entry No." := LedgerEntry."Entry No." + 100;
                            LedgerEntry."Source Document Type" := LedgerEntry."source document type"::"Emergency Drill";
                            LedgerEntry."Source Document No" := Rec."Drill ID";
                            LedgerEntry."Posting Date" := Today;
                            LedgerEntry.Action := DrillActionPlan.Action;
                            LedgerEntry."Action Type" := DrillActionPlan."Action Type";
                            LedgerEntry."Due Date" := DrillActionPlan."Planned Date";
                            LedgerEntry."Action Owner ID" := DrillActionPlan."Owner ID";
                            LedgerEntry."OSH Responsibility" := DrillActionPlan.Responsibility;
                            LedgerEntry."Primary Responsibility Center" := Rec."Region ID";
                            LedgerEntry."Evacuation Event ID" := DrillActionPlan."Evacuation Event ID";
                            LedgerEntry."Criteria Code" := DrillActionPlan."Criteria Code";
                            LedgerEntry.Insert(true);
                        until DrillActionPlan.Next = 0;
                    end;
                    Rec.Posted := true;
                    Rec.Modify(true);
                    Message('Posted Successfully');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Drill Response Team_Promoted"; "Drill Response Team")
                {
                }
                actionref("Emergency Contacts_Promoted"; "Emergency Contacts")
                {
                }
                actionref("Other Informed Workgroups_Promoted"; "Other Informed Workgroups")
                {
                }
                actionref("Drill Evaluation Summary_Promoted"; "Drill Evaluation Summary")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Category6)
            {
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
            group(Category_Category7)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    var
        DrillActionPlan: Record "Emergency Drill Action Plan";
        LedgerEntry: Record "OSH Actions Ledger Entry";
}

#pragma implicitwith restore

