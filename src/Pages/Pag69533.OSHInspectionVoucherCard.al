

page 69533 "OSH Inspection Voucher Card"
{
    PageType = Document;
    SourceTable = "Inspection Voucher";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Drill ID"; Rec."Drill ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Drill Document Type"; Rec."Drill Document Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("OSH Management Plan ID"; Rec."OSH Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Management Plan ID field.';
                }
                field("OSH Plan Calendar ID"; Rec."OSH Plan Calendar ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Plan Calendar ID field.';
                }
                field("Inspection Template"; Rec."Inspection Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Template field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date of Drill"; Rec."Date of Drill")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Inspection';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date of Inspection field.';
                }
                field("Drill Start Time"; Rec."Drill Start Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Time';
                    ToolTip = 'Specifies the value of the Start Time field.';
                }
                field("Drill End Time"; Rec."Drill End Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'End Time';
                    ToolTip = 'Specifies the value of the End Time field.';
                }
            }
            part(Control17; "OSH Inspection Lines")
            {
                SubPageLink = "Inspection Type" = field("Inspection Type"),
                              "Template ID" = field("Drill ID");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
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
                        Report.Run(95000, true, true, Rec);
                end;
            }
            action("Inspection Categories")
            {
                ApplicationArea = Basic;
                Image = AllLines;
                RunObject = Page "Inspection Voucher Categories";
                RunPageLink = "Template ID" = field("Drill ID"),
                              "Inspection Type" = field("Inspection Type");
                ToolTip = 'Executes the Inspection Categories action.';
            }
            action("Suggest Inspection Checklist")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                ToolTip = 'Executes the Suggest Inspection Checklist action.';
                trigger OnAction()
                begin
                    InspectionVoucherCategory.Reset;
                    InspectionVoucherCategory.SetRange("Template ID", Rec."Drill ID");
                    if InspectionVoucherCategory.FindSet then
                        InspectionVoucherCategory.DeleteAll;
                    InspectionVoucherLine.Reset;
                    InspectionVoucherLine.SetRange("Template ID", Rec."Drill ID");
                    if InspectionVoucherLine.FindSet then
                        InspectionVoucherLine.DeleteAll;

                    InspectionTemplateCategory.Reset;
                    InspectionTemplateCategory.SetRange("Template ID", Rec."Inspection Template");
                    if InspectionTemplateCategory.FindSet then begin
                        repeat
                            InspectionVoucherCategory.Init;
                            InspectionVoucherCategory."Template ID" := Rec."Drill ID";
                            InspectionVoucherCategory."Inspection Type" := InspectionVoucherCategory."inspection type"::"OSH Inspection";
                            InspectionVoucherCategory."Category Code" := InspectionTemplateCategory."Category Code";
                            InspectionVoucherCategory.Description := InspectionTemplateCategory.Description;
                            InspectionVoucherCategory.Insert(true);
                        until InspectionTemplateCategory.Next = 0;
                    end;
                    InspectionTemplateLine.Reset;
                    InspectionTemplateLine.SetRange("Template ID", Rec."Inspection Template");
                    if InspectionTemplateLine.FindSet then begin
                        repeat
                            InspectionVoucherLine.Init;
                            InspectionVoucherLine."Template ID" := Rec."Drill ID";
                            InspectionVoucherLine."Line No." := InspectionVoucherLine."Line No." + 100;
                            InspectionVoucherLine."Inspection Type" := InspectionVoucherLine."inspection type"::"OSH Inspection";
                            InspectionVoucherLine."Category Code" := InspectionTemplateLine."Category Code";
                            InspectionVoucherLine.Description := InspectionTemplateLine.Description;
                            InspectionVoucherLine."Requirement Type" := InspectionTemplateLine."Requirement Type";
                            InspectionVoucherLine."Response Type" := InspectionTemplateLine."Response Type";
                            InspectionVoucherLine.Insert(true);
                        until InspectionTemplateLine.Next = 0;
                    end;
                    Message('Successfully Suggested');
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = PostApplication;
                ToolTip = 'Executes the Submit action.';
                trigger OnAction()
                begin
                    Message('Submitted Successfully');
                end;
            }
        }
        area(Promoted)
        {
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
                actionref("Suggest Inspection Checklist_Promoted"; "Suggest Inspection Checklist")
                {
                }
                actionref(Submit_Promoted; Submit)
                {
                }
                actionref("Inspection Categories_Promoted"; "Inspection Categories")
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Inspection Type" := Rec."inspection type"::"OSH Inspection";
    end;

    var
        InspectionVoucherLine: Record "Inspection Voucher Line";
        InspectionVoucherCategory: Record "Inspection Voucher Category";
        InspectionTemplateLine: Record "Inspection Template Line";
        InspectionTemplateCategory: Record "Inspection Template Category";
}

#pragma implicitwith restore

