page 50289 "Budgeting & Workplan Role Cent"
{
    PageType = RoleCenter;
    Caption = 'Finance & Budgeting Role Center';

    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline Judiciary")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control9; "Planning & Strategy Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            part(Control123; "Approvals Activities")
            {
                ApplicationArea = Basic, Suite;

            }
            part(Control5; "Help And Chart Wrapper")
            {
                ApplicationArea = Basic, Suite;
                Caption = '';
                ToolTip = 'Specifies the view of your business assistance';
            }

        }
    }
    actions
    {
        area(processing)
        {
        }
        area(embedding)
        {
            action(Budget)
            {
                Caption = 'Budget';
                ApplicationArea = Basic, Suite;
                RunObject = Page "G/L Budget Names";
            }
        }
        area(sections)
        {
            group("Resource Requirements")
            {
                group("Resource Requirements1")
                {
                    Caption = 'Resource Requirements';
                    action("Open Resource Requirements")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Functional Annual Workplans";
                        RunPageLink = "Planning Budget Type" = const(Original), "Approval Status" = Const(Open), Archived = const(false), Consolidated = const(false);
                    }
                    action("Resource Requirements Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Functional Annual Workplans";
                        RunPageLink = "Planning Budget Type" = const(Original), "Approval Status" = Const("Pending Approval"), Archived = const(false), Consolidated = const(false);
                    }
                    action("Approved Resource Requirements")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Functional Annual Workplans";
                        RunPageLink = "Planning Budget Type" = const(Original), "Approval Status" = Const(Released), Archived = const(false), Consolidated = const(false);
                    }
                    action("Archived Resource Requirements")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Functional Annual Workplans";
                        RunPageLink = "Planning Budget Type" = const(Original), Archived = const(true), Consolidated = const(false);
                    }
                }
                action("Submitted Resource Requirements")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Functional Annual Workplans";
                    RunPageLink = "Planning Budget Type" = const(Original), Archived = const(false), Consolidated = const(true);
                }
                group("Resource Requirements Consolidations")
                {
                    action("Open Resource Requirements Consolidations")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Resource Req. Cons List";
                        RunPageLink = "Approval Status" = Const(Open), Archived = const(false), "Posted" = const(false);
                    }
                    action("Resource Requirements Consolidations Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Resource Req. Cons List";
                        RunPageLink = "Approval Status" = Const("Pending Approval"), Archived = const(false), "Posted" = const(false);
                    }
                    action("Resource Requirements Consolidations Approved")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Resource Req. Cons List";
                        RunPageLink = "Approval Status" = Const(Released), Archived = const(false), "Posted" = const(false);
                    }
                    action("Archived Resource Requirements Consolidations")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Resource Req. Cons List";
                        RunPageLink = Archived = const(true);
                    }
                    action("Posted Resource Requirements Consolidations")
                    {
                        RunObject = Page "Resource Req. Cons List";
                        RunPageLink = "Posted" = const(true);
                        ApplicationArea = All;
                    }
                }
            }
            group("Draft Workplans")
            {
                Caption = 'Workplans';
                group("Draft Workplans (Stations)")
                {
                    Caption = 'Draft Workplans';
                    action("Open Draft Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Draft Workplan List";
                        RunPageLink = "Approval Status" = Const(Open), Archived = const(false), Consolidated = const(false);
                    }
                    action("Draft Workplans Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Draft Workplan List";
                        RunPageLink = "Approval Status" = Const("Pending Approval"), Archived = const(false), Consolidated = const(false);
                    }
                    action("Approved Draft Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Draft Workplan List";
                        RunPageLink = "Approval Status" = Const(Released), Archived = const(false), Consolidated = const(false);
                    }
                    action("Archived Draft Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Draft Workplan List";
                        RunPageLink = Archived = const(true), Consolidated = const(false);
                    }
                }
                action("Submitted Draft Workplans")
                {
                    Caption = 'Submitted Workplans';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Draft Workplan List";
                    RunPageLink = Consolidated = const(true);
                }
                group("Draft Worplan Consolidations(HQ)")
                {
                    Caption = 'Workplan Consolidations';
                    action("Open Draft Workplan Consolidations")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Open Workplan Consolidations';
                        RunObject = Page "Draft Workplan Cons. List";
                        RunPageLink = "Approval Status" = Const(Open), Archived = const(false), "Posted" = const(false), Stage = const(Finance);
                    }
                    action("Draft Workplan Consolidations Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Workplan Consolidations Pending Approval';
                        RunObject = Page "Draft Workplan Cons. List";
                        RunPageLink = "Approval Status" = Const("Pending Approval"), Archived = const(false), "Posted" = const(false), Stage = const(Finance);
                    }
                    action("Approved Draft Workplan Consolidations")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Approved Workplan Consolidations';
                        RunObject = Page "Draft Workplan Cons. List";
                        RunPageLink = "Approval Status" = Const(Released), Archived = const(false), Stage = const(Finance);
                    }
                    action("Archived Draft Workplan Consolidations")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Archived Workplan Consolidations';
                        RunObject = Page "Draft Workplan Cons. List";
                        RunPageLink = Archived = const(true), Stage = const(Finance);
                    }
                }
                action("Draft Workplan Consolidation to JSC")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Workplan With JSC Comments';
                    Visible = false;
                    RunObject = Page "Draft Workplan Cons. List";
                    RunPageLink = Stage = const(JSC);
                }
                Action("Draft  Workplans Consolidation to NA")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Draft Estimates With National Assembly Comments';
                    RunObject = Page "Draft Workplan Cons. List";
                    RunPageLink = Stage = const(NA);
                }
                action("Approved Workplans1")
                {
                    Caption = 'Printed Estimates';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Draft Workplan Cons. List";
                    RunPageLink = Stage = const("Fully Approved"), Posted = const(false);
                }
                action("Posted Workplans1")
                {
                    Caption = 'Posted Approved Workplans';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Draft Workplan Cons. List";
                    RunPageLink = Stage = const("Fully Approved"), Posted = const(true);
                }
            }
            group("Expenditure Management")
            {
                group("Authority to Incure Expenses (AIE)")
                {
                    group("Batch AIES")
                    {
                        action("Batch AIES1")
                        {
                            Caption = 'Batch AIES';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Batch Auth To Incur Exp. List";
                            RunPageLink = "Approval Status" = const(Open);
                        }
                        action("Batch AIES Pending Appproval")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Batch Auth To Incur Exp. List";
                            RunPageLink = "Approval Status" = const("Pending Approval");
                        }
                        action("Approved Batch AIES")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Batch Auth To Incur Exp. List";
                            RunPageLink = "Approval Status" = const(Released), Posted = const(false);
                        }
                        action("Posted Batch AIES")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Batch Auth To Incur Exp. List";
                            RunPageLink = Posted = const(true);
                        }
                    }
                    group(AIES1)
                    {
                        Caption = 'AIES';
                        action("AIES")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Auth. To Incur List";
                            RunPageLink = "Approval Status" = const(Open);
                        }
                        action("AIES Pending Appproval")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Auth. To Incur List";
                            RunPageLink = "Approval Status" = const("Pending Approval");
                        }
                        action("Approved AIES")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Auth. To Incur List";
                            RunPageLink = "Approval Status" = const(Released), Posted = const(false);
                        }
                        action("Posted AIES")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Auth. To Incur List";
                            RunPageLink = Posted = const(true);
                        }
                    }
                    group(AIE2)
                    {
                        Caption = 'Consolidated AIES';
                        action("Open Consolidated AIEs")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "AIE Consolidations";
                            RunPageLink = "Approval Status" = const(Open);
                        }
                        action("Consolidated AIEs Pending Approval")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "AIE Consolidations";
                            RunPageLink = "Approval Status" = const("Pending Approval");
                        }
                        action("Approved Consolidated AIEs")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "AIE Consolidations";
                            RunPageLink = "Approval Status" = const(Released);
                        }
                    }
                    group("Special AIES")
                    {
                        group(Normal)
                        {
                            action("Special AIES1")
                            {
                                Caption = 'Special AIES';
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Special AIES List";
                                RunPageLink = "Approval Status" = const(Open);
                            }
                            action("Special AIES Pending Approval")
                            {
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Special AIES List";
                                RunPageLink = "Approval Status" = const("Pending Approval");
                            }
                            action("Approved Special AIES")
                            {
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Special AIES List";
                                RunPageLink = "Approval Status" = const(Released), Posted = const(false);
                            }
                            action("Posted Special AIES")
                            {
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Special AIES List";
                                RunPageLink = Posted = const(true);
                            }
                        }
                        group(Mobile)
                        {
                            Caption = 'Mobile Court AIES';
                            action("mSpecial AIES1")
                            {
                                Caption = 'Mobile Special AIES';
                                ApplicationArea = Basic, Suite;
                                RunObject = Page "Unplanned Special AIE";
                                RunPageLink = "Approval Status" = const(Open);
                            }
                            action("mSpecial AIES Pending Approval")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'Mobile Pending Approval';
                                RunObject = Page "Unplanned Special AIE";
                                RunPageLink = "Approval Status" = const("Pending Approval");
                            }
                            action("mApproved Special AIES")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'Mobile Approved Special AIES';
                                RunObject = Page "Unplanned Special AIE";
                                RunPageLink = "Approval Status" = const(Released), Posted = const(false);
                            }
                            action("mPosted Special AIES")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'Mobile Posted Special AIES';
                                RunObject = Page "Unplanned Special AIE";
                                RunPageLink = Posted = const(true);
                            }

                        }
                    }
                }
                group("Expenditure Requisitions (EXR)")
                {
                    group("Expenditure Requisitions")
                    {
                        action(ExpReq1)
                        {
                            Caption = 'Expenditure Requisitions';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Expense Requisitions";
                            RunPageLink = "Approval Status" = const(Open);
                        }
                        action("Expenditure Requisitions Pending Approval")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Expense Requisitions";
                            RunPageLink = "Approval Status" = const("Pending Approval");
                        }
                        action("Approved Expenditure Requisitions")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Expense Requisitions";
                            RunPageLink = "Approval Status" = const(Released), Status = const("Pending Commitment");
                        }
                    }
                    action("Committed Expenditure Requisitions")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Expense Requisitions";
                        RunPageLink = Status = const("committed"), "Approval Status" = const(Released);
                    }
                    action("Recalled Expenditure Requisitions")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Expense Requisitions";
                        RunPageLink = Status = const("Recalled");
                    }
                    action("Expenditure Requisitions Fully Utilized")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Expense Requisitions";
                        RunPageLink = Status = const("Fully Utilized");
                    }
                }
                group("Budget Control")
                {
                    action("Open Budget Controls")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Budget Control Header";
                        RunPageLink = "Approval Status" = Filter(Open);
                    }
                    action("Approved Budget Controls")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Budget Control Header";
                        RunPageLink = "Approval Status" = const(Approved);
                    }
                }
            }
            group("Budget Adjustments")
            {
                group("Budget Reallocations")
                {
                    action("Budget Reallocation")
                    {
                        Caption = 'Budget ReAllocations';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Budget Reallocations";
                        RunPageLink = "Approval Status" = const(Open);
                    }
                    action("Budget ReAllocations Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Budget Reallocations";
                        RunPageLink = "Approval Status" = const("Pending Approval");
                    }
                    action("Approved Budget ReAllocations")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Budget Reallocations";
                        RunPageLink = "Approval Status" = const(Approved), Posted = const(false);
                    }
                    action("Open Consolidated ReAllocations")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Cons Budget Reallocations";
                        RunPageLink = "Approval Status" = const(Open), Posted = const(false);
                    }
                    // action("Consolidated ReAllocations Committee")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     RunObject = Page "Cons Budget Reallocations";
                    //     RunPageLink = "Approval Status" = const(Committee), Posted = const(false);
                    // }
                    action("Consolidated ReAllocations Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Consolidated ReAllocations Pending Approval';
                        RunObject = Page "Cons Budget Reallocations";
                        RunPageLink = "Approval Status" = const("Pending Approval"), Posted = const(false);
                    }
                    action("Approved Consolidated ReAllocations")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Cons Budget Reallocations";
                        RunPageLink = "Approval Status" = const(Approved), Posted = const(false);
                    }
                    action("Posted Consolidated ReAllocations")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Cons Budget Reallocations";
                        RunPageLink = "Approval Status" = const(Approved), Posted = const(true);
                    }
                    action("Posted Budget ReAllocations")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Budget Reallocations";
                        RunPageLink = Posted = const(true);
                        Visible = false;
                    }
                }
                group("Supplementary Budgets")
                {
                    group("Supplementary By Workplan")
                    {
                        action("Supplementary Budget1")
                        {
                            Caption = 'Open Supplementary Budgets';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Supplementary Cons List";
                            RunPageLink = "Approval Status" = const(Open);
                        }
                        action("Supplementary Budget2")
                        {
                            Caption = 'Supplementary Budgets Pending Approval';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Supplementary Cons List";
                            RunPageLink = "Approval Status" = const("Pending Approval");
                        }
                        action("Supplementary Budget3")
                        {
                            Caption = 'Approved Supplementary Budgets';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Supplementary Cons List";
                            RunPageLink = "Approval Status" = const(Released);
                        }
                        action("Supplementary Budget")
                        {
                            Caption = 'Supplementary Budgets';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Supplementary Budgets";
                            RunPageLink = "Approval Status" = const(Open);
                        }
                        action("Supplementary Budgets Pending Approval")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Supplementary Budgets";
                            RunPageLink = "Approval Status" = const("Pending Approval");
                        }
                        action("Approved Supplementary Budgets")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Supplementary Budgets";
                            RunPageLink = "Approval Status" = const(Approved), Posted = const(false);
                        }
                        action("Posted Supplementary Budgets")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Supplementary Budgets";
                            RunPageLink = Posted = const(true);
                        }
                    }
                    group("Supplementary By Budget Item")
                    {
                        action("Supplementary Budget12")
                        {
                            Caption = 'Supplementary Budgets';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Supplementary Budget List";
                            //RunPageLink = "Approval Status" = const(Approved);
                        }
                    }
                }
                group("Draft Workplans1")
                {
                    Caption = 'Draft Supplementary Workplans';
                    action("Open Supplementary Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Draft Workplan List";
                        RunPageLink = "Approval Status" = Const(Open), Archived = const(false), Consolidated = const(false), "Planning Budget Type" = const("Supplementary 2");
                    }
                    action("Supplementary Workplans Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Draft Workplan List";
                        RunPageLink = "Approval Status" = Const("Pending Approval"), Archived = const(false), Consolidated = const(false), "Planning Budget Type" = const("Supplementary 2");
                    }
                    action("Approved Supplementary Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Draft Workplan List";
                        RunPageLink = "Approval Status" = Const(Released), Archived = const(false), Consolidated = const(false), "Planning Budget Type" = const("Supplementary 2");
                    }
                    action("Archived Supplementary Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Draft Workplan List";
                        RunPageLink = Archived = const(true), Consolidated = const(false), "Planning Budget Type" = const("Supplementary 2");
                    }
                }
                action("Submitted Supplementary Workplans")
                {
                    Caption = 'Submitted Workplans';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Draft Workplan List";
                    RunPageLink = Consolidated = const(true), "Planning Budget Type" = const("Supplementary 2");
                }
                group("Supplementary Worplan Consolidations(HQ)")
                {
                    Caption = ' Supplementary Workplan Consolidations';
                    action("Open Supplementary Workplan Consolidations")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Open Workplan Consolidations';
                        RunObject = Page "Draft Workplan Cons. List";
                        RunPageLink = "Approval Status" = Const(Open), Archived = const(false), "Posted" = const(false), Stage = const(Finance), "Planning Budget Type" = const("Supplementary 2");
                    }
                    action("Supplementary Workplan Consolidations Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Workplan Consolidations Pending Approval';
                        RunObject = Page "Draft Workplan Cons. List";
                        RunPageLink = "Approval Status" = Const("Pending Approval"), Archived = const(false), "Posted" = const(false), Stage = const(Finance), "Planning Budget Type" = const("Supplementary 2");
                    }
                    action("Approved Supplementary Workplan Consolidations")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Approved Workplan Consolidations';
                        RunObject = Page "Draft Workplan Cons. List";
                        RunPageLink = "Approval Status" = Const(Released), Archived = const(false), "Posted" = const(false), Stage = const(Finance), "Planning Budget Type" = const("Supplementary 2");
                    }
                    action("Archived Supplementary Workplan Consolidations")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Archived Workplan Consolidations';
                        RunObject = Page "Draft Workplan Cons. List";
                        RunPageLink = Archived = const(true), Stage = const(Finance), "Planning Budget Type" = const("Supplementary 2");
                    }
                }
                action("Revised Estimates")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Revised Estimates';
                    RunObject = Page "Draft Workplan Cons. List";
                    RunPageLink = Archived = const(true), Stage = const("Fully Approved"), "Planning Budget Type" = const("Supplementary 2");
                }
            }


            group(Reports)
            {
                group(ResourceRequirements)
                {
                    Caption = 'Resource Requirements';
                    action("Summary of Recurrent Budget by Head Total (FORM A)")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = report "SummaryOfRecurrrentBudget";
                    }
                    action("Recurrent Sub Chapter Analysis MTEF")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = report "RecurrentSubChapterAnalysiMTEF";
                    }
                    action("Summary of Resource By Admin")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Summary of Resource Requirements By Spending Unit';
                        RunObject = report "Summary of Resource By Admin";
                    }
                }
                group("Recurrent Budget")
                {
                    action("Budget Votebook Status")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Station Votebook";
                    }
                    action("Itemized Budget Summary")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Itemized Budget Summary";
                    }
                    action("Recurrent Expenditure Summary Report")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Recurent Expenditure Summary";
                    }
                    action("Summary of Recurent budgets by Heads")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = report SummaryofResourceRequirements;
                    }
                    action("By Head By Item")
                    {
                        Caption = 'Expenditure by Head by Item';
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Expenditure By Head";
                    }
                    action("By Head and Programme")
                    {
                        Caption = 'Expenditure Analysis by Head and Programme';
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Exp. An. by Head and Programme";
                    }
                    action("By Item by Head")
                    {
                        Caption = 'Expenditure Analysis by Item by Head';
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Exp. An. by Item by Head";
                        Visible = false;
                    }
                    action("Prog Econ")
                    {
                        Caption = 'Expenditure Analysis by Program and Economic Classification';
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Program and Economic Classific";
                        Visible = false;
                    }
                    action("Consolidated Exp")
                    {
                        Caption = 'Consolidated Expenditure by Economic Items';
                        ApplicationArea = Basic, Suite;
                        Visible = false;
                        // RunObject = report "Cons Expenditure by Economic";
                    }
                }
                group("Expenditure Absoprtion")
                {
                    action("Part IV")
                    {
                        Caption = 'Payroll Year Projections';
                        ApplicationArea = Basic, Suite;
                        RunObject = report "Payroll Projections Report";
                    }
                    action("Par")
                    {
                        Caption = 'Payroll Summary By Grade';
                        ApplicationArea = Basic, Suite;
                        RunObject = report "PR Payroll Summary By Grade";
                    }
                    action("PBB")
                    {
                        Caption = 'PBB Tables';
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "PBB";
                    }

                }
                group("Development Budget")
                {
                    action("PwBB1")
                    {
                        Caption = 'Development Budget and Source of Funding (Form E)';
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Dev Source of Funds";
                        Visible = false;
                    }
                    action("PBB12")
                    {
                        Caption = 'Development Budget by Head and Items';
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Dev Head and Items";
                        Visible = false;
                    }
                    action("PBB3")
                    {
                        Caption = 'Development Budget by Head and Economic Items';
                        ApplicationArea = Basic, Suite;
                        Visible = false;
                        // RunObject = report "Dev Head and Economic Items";
                    }
                    action("PBB4")
                    {
                        Caption = 'Form C';
                        ApplicationArea = Basic, Suite;
                        // RunObject = report "Form C";
                        Visible = false;
                    }
                }
            }
            group("Set Up")
            {
                action("SPM Setup")
                {
                    Caption = 'Strategy General Setup';
                    ApplicationArea = Basic, Suite;
                    Runobject = page "Strategy General Setup";
                }
                // action("KCB Payments")
                // {
                //     Caption = 'Failed KCB Payments';
                //     ApplicationArea = Basic, Suite;
                //     Runobject = page "KCB Payments Buffer";
                //     RunPageView = where(Fetched = const(false), Failed = const(true));
                // }
                action("GL ACC")
                {
                    Caption = 'Chart of Accounts';
                    ApplicationArea = Basic, Suite;
                    // Runobject = page "Chart of Accounts NonEdit";
                    Visible = false;
                    //RunPageView = where(Fetched = const(false), Failed = const(true));
                }
                action(CSP)
                {
                    Caption = 'Corporate Strategic Plans';
                    ApplicationArea = Basic, Suite;
                    Runobject = page "All CSPS";
                    //RunPageView = where(Fetched = const(false), Failed = const(true));
                }
            }
            group("Annual Workplans")
            {
                Visible = false;
                Image = Travel;
                action("Functional Annual Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Station Annual Workplan';
                    RunObject = Page "Functional Annual Workplans";
                }
                action("Approved Functional Annual Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Station Annual Workplan';
                    RunObject = Page "Approved Functional PCs List";
                }
                action("Corporate Annual Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Station Annual Workplan';
                    RunObject = Page "Annual Strategy Workplans";
                }
                action("Approved Corporate Annual Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft  Annual Workplan';
                    RunObject = Page "Approved Annual Workplans";
                    RunPageMode = View;
                    RunPageView = where("Approval Status" = filter(Released));
                }
                action("Budget Allocation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Allocation';
                    RunObject = Page "Budget Estimates List";
                    Visible = true;
                }
                action("Annual Budget Ceilings")
                {
                    ApplicationArea = Basic;
                    Caption = 'Annual Budget Ceilings';
                    RunObject = Page "Annual Budget Ceilings";
                    Visible = true;
                }
                action("Budgdet Revision")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Revision';
                    Visible = true;
                    RunObject = Page "Annual Workplans Revision";
                }
                action("Workplan Revision Allignment Tool")
                {
                    ApplicationArea = Basic;
                    Caption = 'Workplan Revision Allignment Tool';
                    // RunObject = Page "Workplan Rev Alignment Tool";
                    Visible = true;
                }
                action("Budget Revision Consolidation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Revision Consolidations';
                    // RunObject = Page "Budget Rev Consolidation List";
                    Visible = true;
                }
                action("Posted Budget Consolidations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Budget Consolidations';
                    // RunObject = Page "Posted Consolidation List";
                    Visible = true;
                }
                action("Functional Revision Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Station Revison Workplans';
                    // RunObject = Page "Functional Revision Workplans";
                    Visible = true;
                }
                action("Station Workplan Revision Alignments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Station Workplan Revision Alignments';
                    // RunObject = Page "Dept Workplan Rev Alignment";
                    Visible = true;
                }
            }
            group("Notices/Memos")
            {
                Caption = 'Notice';
                Image = Ledger;


                action("Publish A Notice/Memo")
                {
                    Caption = 'Create A Notice/Memo';
                    ApplicationArea = basic;
                    // RunObject = page "Hr Noticeboard";
                }

                action("Published Notices")
                {
                    Caption = 'Created Notices/Memos';
                    ApplicationArea = basic;
                    // RunObject = page "Hr Noticeboard";
                    // RunPageView = where(Status = filter(true));
                }

            }


        }
    }
}
