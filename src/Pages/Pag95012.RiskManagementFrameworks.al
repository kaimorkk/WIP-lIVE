

page 95012 "Risk Management Frameworks"
{
    CardPageID = "Risk Management Framework";
    PageType = List;
    SourceTable = "Risk Management Framework";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                }
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
                field("No. Of Risk Mgt Plans"; Rec."No. Of Risk Mgt Plans")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Risk Mgt Plan Nos."; Rec."Corporate Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
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
                }
                field("Departmenta Risk Mgt Plan Nos."; Rec."Departmenta Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Regional Risk Mgt Plan Nos."; Rec."Regional Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Incident Nos."; Rec."Risk Incident Nos.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

