

page 95108 "Internal Audit Charters"
{
    CardPageID = "Internal Audit Charter";
    PageType = List;
    SourceTable = "Internal Audit Charter";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Overview; Rec.Overview)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overview field.';
                }
                field("CAE ID"; Rec."CAE ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CAE ID field.';
                }
                field("CAE Name"; Rec."CAE Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CAE Name field.';
                }
                field("CAE Directly Reports-To"; Rec."CAE Directly Reports-To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CAE Directly Reports-To field.';
                }
                field("CAE Indirectly Reports-To"; Rec."CAE Indirectly Reports-To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CAE Indirectly Reports-To field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved By field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Mission)
            {
                ApplicationArea = Basic;
                Image = MapSetup;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Mission));
                ToolTip = 'Executes the Mission action.';
            }
            action(Purpose)
            {
                ApplicationArea = Basic;
                Image = OverdueMail;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Purpose));
                ToolTip = 'Executes the Purpose action.';
            }
            action("Standards & Code Of Ethics")
            {
                ApplicationArea = Basic;
                Image = Setup;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Standards));
                ToolTip = 'Executes the Standards & Code Of Ethics action.';
            }
            action(Authority)
            {
                ApplicationArea = Basic;
                Image = Alerts;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Authority));
                ToolTip = 'Executes the Authority action.';
            }
            action("Independence & Objectivity")
            {
                ApplicationArea = Basic;
                Image = CalculatePlanChange;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Independence));
                ToolTip = 'Executes the Independence & Objectivity action.';
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = SelectReport;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Scope));
                ToolTip = 'Executes the Scope action.';
            }
            action("QA & Improvement Program")
            {
                ApplicationArea = Basic;
                Caption = 'Quality Assurance & Improvement Program';
                Image = AnalysisViewDimension;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter("Quality Assurance"));
                ToolTip = 'Executes the Quality Assurance & Improvement Program action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = BOMLedger;
                //RunObject = Report "Audit Mobilization Header";
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    // RESET;
                    // SETRANGE();
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Mission_Promoted; Mission)
                {
                }
                actionref(Purpose_Promoted; Purpose)
                {
                }
                actionref("Standards & Code Of Ethics_Promoted"; "Standards & Code Of Ethics")
                {
                }
                actionref(Authority_Promoted; Authority)
                {
                }
                actionref("Independence & Objectivity_Promoted"; "Independence & Objectivity")
                {
                }
                actionref(Scope_Promoted; Scope)
                {
                }
                actionref("QA & Improvement Program_Promoted"; "QA & Improvement Program")
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

