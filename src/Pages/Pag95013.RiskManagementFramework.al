

page 95013 "Risk Management Framework"
{
    PageType = Card;
    SourceTable = "Risk Management Framework";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Purpose"; Rec."Primary Purpose")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Responsibility"; Rec."Overall Responsibility")
                {
                    ApplicationArea = Basic;
                }
                field("Last Revision Date"; Rec."Last Revision Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Risk Qualification/Measurements")
            {
                Caption = 'Risk Qualification/Measurements';
                field("Default Risk LR Scale ID"; Rec."Default Risk LR Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default Risk Impact R. Scale"; Rec."Default Risk Impact R. Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Default Overall RR Scale ID"; Rec."Default Overall RR Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default Risk AR Scale ID"; Rec."Default Risk AR Scale ID")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("Corporate Risk Mgt Plan Nos."; Rec."Corporate Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Functional Risk Mgt Plan Nos."; Rec."Functional Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Risk Mgt Plan Nos."; Rec."Project Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Risk Mgt Plan Nos."; Rec."Directorate Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    Caption = 'CEO''s Office Risk Mgt Plan Nos.';
                    Visible = true;
                }
                field("Departmenta Risk Mgt Plan Nos."; Rec."Departmenta Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Divisional Risk Mgt Plan Nos.';
                }
                field("Regional Risk Mgt Plan Nos."; Rec."Regional Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Incident Nos."; Rec."Risk Incident Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("New Risk Voucher Nos"; Rec."New Risk Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Status Report Nos"; Rec."Status Report Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control34; "Risk Mgt Framework FactBox")
            {
                Caption = 'Risk Measurement & Control Statistics';
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = AddToHome;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section" = filter("RMF Overview"));
            }
            action("Purpose(Goals & Objectives)")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section" = filter("Benefits/Importance"));
            }
            action("Guiding Principles")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section" = filter("RMF Guiding Principle"));
            }
            action("Stakeholder Register")
            {
                ApplicationArea = Basic;
                Image = Stop;
                RunObject = Page StakeHolders;
            }
            action("Risk Taxonomy")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                RunObject = Page "Risk Categories";
            }
            action("Risk Response Strategies")
            {
                ApplicationArea = Basic;
                Image = ServiceAgreement;
                RunObject = Page "Risk Response Strategies";
            }
            action("Roles & Responsibilities")
            {
                ApplicationArea = Basic;
                Image = Restore;
                RunObject = Page "Risk Management Roles";
            }
            action("Risk Identification Methods")
            {
                ApplicationArea = Basic;
                Image = Indent;
                RunObject = Page "Risk Identification Methods";
            }
            action("Risk Likelihood Rating Scales")
            {
                ApplicationArea = Basic;
                Image = Production;
                RunObject = Page "Risk Likelihood Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Likelihood Rating"));
            }
            action("Risk Impact Rating Scales")
            {
                ApplicationArea = Basic;
                Image = AdjustItemCost;
                RunObject = Page "Risk Impact Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Impact Rating"));
            }
            action("Risk Overal Rating Scales")
            {
                ApplicationArea = Basic;
                Image = OrderList;
                RunObject = Page "Risk Overall Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Overall Risk Rating"));
            }
            action("Risk Appetite Rating Scales")
            {
                ApplicationArea = Basic;
                Image = Add;
                RunObject = Page "Risk Appetite Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Risk Appetite Rating"));
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Primary Key", Rec."Primary Key");
                    Report.Run(95000, true, true, Rec);
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Approved RMF ';
                Image = Attach;

                trigger OnAction()
                begin
                    //DMSManagement.FnUploadPurchaseInvoiceDocuments("Code",'Purchase Invoice',RECORDID);
                    // DMSManagement.FnUploadPurchaseInvoiceDocuments("Doc");

                    //CC
                    // DMSManagement.FnUploaRMFDocuments(Rec."External Document No", Rec.Description, Rec.RecordId);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Overview_Promoted; Overview)
                {
                }
                actionref("Purpose(Goals & Objectives)_Promoted"; "Purpose(Goals & Objectives)")
                {
                }
                actionref("Guiding Principles_Promoted"; "Guiding Principles")
                {
                }
                actionref("Stakeholder Register_Promoted"; "Stakeholder Register")
                {
                }
                actionref("Risk Taxonomy_Promoted"; "Risk Taxonomy")
                {
                }
                actionref("Risk Response Strategies_Promoted"; "Risk Response Strategies")
                {
                }
                actionref("Roles & Responsibilities_Promoted"; "Roles & Responsibilities")
                {
                }
                actionref("Risk Identification Methods_Promoted"; "Risk Identification Methods")
                {
                }
                actionref("Risk Likelihood Rating Scales_Promoted"; "Risk Likelihood Rating Scales")
                {
                }
                actionref("Risk Impact Rating Scales_Promoted"; "Risk Impact Rating Scales")
                {
                }
                actionref("Risk Overal Rating Scales_Promoted"; "Risk Overal Rating Scales")
                {
                }
                actionref("Risk Appetite Rating Scales_Promoted"; "Risk Appetite Rating Scales")
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref("Attach Documents_Promoted"; "Attach Documents")
                {
                }
            }
        }
    }

    var
        // DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

