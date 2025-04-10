

/// <summary>
/// Page Employee Card-HR1 (ID 69162).
/// </summary>
page 52193921 "Employee Card-HR1"
{
    Caption = 'Employee Card';
    // DeleteAllowed = false;
    PageType = Card;
    SourceTable = Employee;
    //InsertAllowed = false;
    //  ModifyAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Kudade;
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'PJ No.';
                    ShowMandatory = true;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnAssistEdit()
                    begin
                        /*IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                          */

                    end;
                }
                field("PSC Employee No."; Rec."PSC Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the Title of the Employee';

                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    Caption = 'Surname';
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Caption = 'Other Names';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s middle name.';
                }
                // field("Record Type"; Rec."Record Type")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Record Type field.';
                // }
                // field(Initials; Rec.Initials)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the employee''s initials.';
                // }
                field("Current Position ID"; Rec."Current Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Position ID field.';
                }
                field("Job Title2"; Rec."Job Title2")
                {

                    ApplicationArea = Basic;
                    Caption = 'Designation';
                    ToolTip = 'Specifies the employee''s job title.';
                }


                // field("Current Job Grade"; Rec."Current Job Grade")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Current Job Grade field.';
                // }
                // field("Current Terms of Service"; Rec."Current Terms of Service")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Current Terms of Service field.';
                // }

                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field("County of Origin"; Rec."County of Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County of Origin field.';
                }
                field("County of Origin Name"; Rec."County of Origin Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County of Origin Name field.';
                }
                field(Ward; Rec.Ward)
                {
                    ApplicationArea = Basic;
                }
                field(Village; Rec.Village)
                {
                    ApplicationArea = Basic;
                }
                field("Sub County"; Rec."Sub County")
                {
                    ApplicationArea = Basic;
                }

                // field("County of Residence"; Rec."County of Residence")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the County of Residence field.';
                // }
                // field("County of Residence Name"; Rec."County of Residence Name")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the County of Residence Name field.';
                // }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s gender.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Disability No."; Rec."Disability No.")
                {
                    //Visible = Rec.Disabled;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disability No. field.';
                }
                field("Disability Cert Expiry"; Rec."Disability Cert Expiry")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disability Cert Expiry field.';
                }
                field("Ethnic Origin"; Rec."Ethnic Group")
                {
                    Caption = 'Ethnicity';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Origin field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies when this record was last modified.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field("Reliver Code"; Rec."Reliver Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliver Code field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Job Details")
            {
                Caption = 'Salary Details';
                Editable = Kudade;

                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field(Present; Rec.Present)
                {
                    caption = 'Salary Notch';
                    ApplicationArea = Basic;
                }
                field("Employee Posting Group1"; Rec."Employee Posting Group")
                {
                    caption = 'Employee Category';
                    ApplicationArea = Basic;
                }
                field("Increment Date"; Rec."Increment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Category Type"; Rec."Employee Category Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Category Type field.';
                    Editable = Kudade;
                }

                field("Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incremental Month field.';
                }
                field("Last Increment Date"; Rec."Last Increment Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Increment Date field.';
                }


            }
            group("Organization Units")
            {
                Editable = Kudade;
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Name field.';
                }
                field("Duty Station"; Rec."Current Duty Station")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Job Type"; Rec."Employee Job Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Job Type field.';
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                Editable = Kudade;
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s address.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional address information.';
                    Visible = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the address.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                // field("Citizenship Type"; Rec."Citizenship Type")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Citizenship Type field.';
                // }
                field("Employee Type"; Rec."Employee Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Type field.';
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field(Extension; Rec.Extension)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s telephone extension.';
                    Visible = false;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s private telephone number.';
                    ShowMandatory = true;
                }
                field(Pager; Rec.Pager)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s pager number.';
                    Visible = false;
                }
                field("Address2."; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Phone No.2"; Rec."Home Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s private email address.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    Caption = 'Organization Email';
                    ToolTip = 'Specifies the employee''s email address at the company.';
                    ShowMandatory = true;
                }
                field("Alt. Address Code"; Rec."Alt. Address Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a code for an alternate address.';
                }
                field("Alt. Address Start Date"; Rec."Alt. Address Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the starting date when the alternate address is valid.';
                    Visible = false;
                }
                field("Alt. Address End Date"; Rec."Alt. Address End Date")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the last day when the alternate address is valid.';
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Phone Number field.';
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ext. field.';
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                Editable = Kudade;
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                // field("Date Of Join"; Rec."Date Of Join")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Last Promotion Date';
                    ToolTip = 'Specifies the value of the Last Promotion Date field.';
                }
                // field(Inducted; Rec.Inducted)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Inducted field.';
                // }
                // field("Pension Scheme Join"; Rec."Pension Scheme Join")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Pension Scheme Join Date';
                //     ToolTip = 'Specifies the value of the Pension Scheme Join Date field.';
                // }
                // field("Medical Scheme Join"; Rec."Medical Scheme Join")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Medical Scheme Join Date';
                //     ToolTip = 'Specifies the value of the Medical Scheme Join Date field.';
                // }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pension Scheme Join Date field.';
                }
                field(TimeinPension; TimeinPension)
                {
                    ApplicationArea = All;
                    Caption = 'Time in Pension';
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement Date field.';
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full / Part Time field.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }

                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Re-Employment Date"; Rec."Re-Employment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Re-Employment Date field.';
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Period field.';
                }
                // field("Send Alert to"; Rec."Send Alert to")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Send Alert to field.';
                // }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment status of the employee.';
                }
                field("Employee Status 2"; Rec."Employee Status 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Status 2 field.';
                }
                field("Inactive Date"; Rec."Inactive Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the employee became inactive, due to disability or maternity leave, for example.';
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a code for the cause of inactivity by the employee.';
                }
                // field("Employees Type"; Rec."Employees Type")
                // {
                //     Caption = 'Employee Type';
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Employees Type field.';
                // }
                field("Emplymt. Contract Code"; Rec."Emplymt. Contract Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment contract code for the employee.';
                }
                // field("Statistics Group Code"; Rec."Statistics Group Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies a statistics group code to assign to the employee for statistical purposes.';
                // }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a resource number for the employee.';
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a salesperson or purchaser code for the employee.';
                }
                // field("Union Code"; Rec."Union Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the employee''s labor union membership code.';
                // }
                // field("Union Membership No."; Rec."Union Membership No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the employee''s labor union membership number.';
                // }
                // field("Disciplinary status"; Rec."Disciplinary status")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Disciplinary status field.';
                // }
            }
            group("Separation Details")
            {
                Editable = Kudade;
                // field("Reason for termination Code"; "Reason for termination Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Grounds for Exit';
                //     ToolTip = 'Specifies the value of the Grounds for Exit field.';
                // }

                // field("Reason for termination"; Rec."Reason for termination")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Reason for Exit';
                //     ToolTip = 'Specifies the value of the Reason for Exit field.';
                // }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exit Date';
                    ToolTip = 'Specifies the date when the employee was terminated, due to retirement or dismissal, for example.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                // field("Exit Interview Conducted"; Rec."Exit Interview Conducted")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Exit Interview Conducted field.';
                // }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = Basic;
                    Editable = ExitDateEditable;
                    ToolTip = 'Specifies the value of the Exit Interview Date field.';
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = Basic;
                    Editable = ExitByEditable;
                    ToolTip = 'Specifies the value of the Exit Interview Done by field.';
                }
                // field("Bonding Amount"; Rec."Bonding Amount")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Bonding Amount field.';
                // }
                field("Exit Status"; Rec."Exit Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Status field.';
                }
                field("Allow Re-Employment In Future"; Rec."Allow Re-Employment In Future")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Re-Employment In Future field.';
                }
            }
            group("Payroll Details")
            {
                Caption = 'Payroll Details';
                Editable = Kudade;
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                    Visible = false;
                }
                // field("Pays tax?"; Rec."Pays tax?")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Pays tax? field.';
                // }
                // field("Pay Wages"; Rec."Pay Wages")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Pay Wages field.';
                // }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                    ShowMandatory = true;
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'N.S.S.F No.';
                    ShowMandatory = true;
                    ToolTip = 'Specifies the social security number of the employee.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s type to link business transactions made for the employee with the appropriate account in the general ledger.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    Caption = 'Employee Category';
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                // field("Claim Limit"; Rec."Claim Limit")
                // {
                //     Caption = 'Medical Claim Limit';
                //     ApplicationArea = Basic;
                // }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
                    Editable = Kudade;
                    field("Bank Account Number"; Rec."Bank Account Number")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the value of the Bank Account Number field.';
                    }
                    field("Employee's Bank"; Rec."Employee's Bank")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the value of the Employee''s Bank field.';
                    }
                    field("Bank Name"; Rec."Bank Name")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the value of the Bank Name field.';
                    }
                    field("Bank Branch"; Rec."Bank Branch")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the value of the Bank Branch field.';
                    }
                    field("Bank Branch Name"; Rec."Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the value of the Bank Branch Name field.';
                    }
                }
                // group("Bank 2")
                // {
                //     Editable = Kudade;
                //     Caption = 'DSA Bank';

                //     field("Employee's Bank 2"; Rec."Employee's Bank 2")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Employee''s Bank 2 field.';
                //     }
                //     field("Bank Name 2"; Rec."Bank Name 2")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Bank Name 2 field.';
                //     }
                //     field("Bank Branch 2"; Rec."Bank Branch 2")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Bank Branch 2 field.';
                //     }
                //     field("Bank Branch Name 2"; Rec."Bank Branch Name 2")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Bank Branch Name 2 field.';
                //     }
                //     field("Bank Account No. 2"; Rec."Bank Account No. 2")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Bank Account No. field.';
                //     }
                // }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                Visible = false;
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Allocated Leave Days field.';
                }
                field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days Carried Forward';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Leave Days Carried Forward field.';
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total Leave Taken field.';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = all;
                    // Enabled = false;
                    Importance = Promoted;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                }
            }

            // group("Leave Details")
            // {
            //     Caption = 'Leave Details';
            //     Editable = Kudade;
            //     field("Allow Negative Leave"; Rec."Allow Negative Leave")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Allow Negative Leave field.';
            //     }
            //     field("Off Days"; Rec."Off Days")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Off Days field.';
            //     }
            //     field("Leave Days B/F"; Rec."Reimbursed Leave Days")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Leave Days B/F';
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Leave Days B/F field.';
            //     }
            //     field("Allocated Leave Days"; Rec."Allocated Leave Days")
            //     {
            //         ApplicationArea = Basic;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Allocated Leave Days field.';
            //     }
            //     field("Total (Leave Days)"; Rec."Total (Leave Days)")
            //     {
            //         ApplicationArea = Basic;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Total (Leave Days) field.';
            //     }
            //     field("Total Leave Taken"; Rec."Total Leave Taken")
            //     {
            //         ApplicationArea = Basic;
            //         Editable = false;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Total Leave Taken field.';
            //     }
            //     field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Leave Outstanding Bal field.';
            //     }
            //     field("Leave Balance"; Rec."Leave Balance")
            //     {
            //         ApplicationArea = Basic;
            //         Enabled = false;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Leave Balance field.';
            //     }
            //     field("Acrued Leave Days"; Rec."Acrued Leave Days")
            //     {
            //         ApplicationArea = Basic;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Acrued Leave Days field.';
            //     }
            //     field("Cash per Leave Day"; Rec."Cash per Leave Day")
            //     {
            //         ApplicationArea = Basic;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Cash per Leave Day field.';
            //     }
            //     field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
            //     {
            //         ApplicationArea = Basic;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Cash - Leave Earned field.';
            //     }
            //     field("Leave Status"; Rec."Leave Status")
            //     {
            //         ApplicationArea = Basic;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Leave Status field.';
            //     }
            //     field("Leave Type Filter"; Rec."Leave Type Filter")
            //     {
            //         ApplicationArea = Basic;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Leave Type Filter field.';
            //     }
            //     field("Leave Period Filter"; Rec."Leave Period Filter")
            //     {
            //         ApplicationArea = Basic;
            //         Importance = Promoted;
            //         ToolTip = 'Specifies the value of the Leave Period Filter field.';
            //     }
            //     field("On Leave"; Rec."On Leave")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the On Leave field.';
            //     }
            // }
        }
        area(factboxes)
        {
            part(Control3; "Employee Picture")
            {
                ApplicationArea = BasicHR;
                Caption = 'Employee Picture';
                SubPageLink = "No." = field("No.");
            }
            part("HR Leave Applications Factbox"; "HR Leave Applications Factbox")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Statistics';
                SubPageLink = "No." = field("No.");
            }
            part("Attached Documents List"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                SubPageLink = "Table ID" = const(Database::Employee),
                              "No." = field("No.");
                UpdatePropagation = Both;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;

                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }

                // action("Employee Airtime Al")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employee Airtime Allocation';
                //     Image = Currencies;
                //     Promoted = true;
                //     PromotedCategory = PROCESS;
                //     RunObject = Page "Employee Airtime Allocation";
                //     RunPageLink = "Employee No" = field("No.");
                // }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5200),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the &Picture action.';
                }
                action("&Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Alternative Addresses action.';
                }
                action("&Relatives")
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    Image = Relatives;
                    Visible = false;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Relatives action.';
                }
                // action("&Next Of Kin")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Next Of Kin';
                //     Image = Relatives;
                //     RunObject = Page "HR Employee Next of Kin";
                //     RunPageLink = "Employee Code" = field("No.");
                //     ToolTip = 'Executes the &Next Of Kin action.';
                // }
                // action("&Employee Doctor")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Employee Doctor';
                //     Image = Relatives;
                //     RunObject = Page "HR Employee Doctor";
                //     RunPageLink = "Employee Code" = field("No.");
                //     ToolTip = 'Executes the &NEmployee Doctor action.';
                // }
                // action("&Employee History")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Employee History';
                //     Image = Relatives;
                //     RunObject = Page "Previous Employer History";
                //     RunPageLink = "Employee Code" = field("No.");
                //     ToolTip = 'Executes the &NEmployee Doctor action.';
                // }

                // action("&Dependants")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Dependants';
                //     Image = Relatives;
                //     RunObject = Page "HR Employees Dependants";
                //     RunPageLink = "Employee Code" = field("No.");
                //     //Visible = false;
                //     ToolTip = 'Executes the &Dependants action.';
                // }
                // action("&Benefiacy")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Beneficiary';
                //     Image = Relatives;
                //     RunObject = Page "HR Beneficiaries List";
                //     RunPageLink = "Employee Code" = field("No.");
                //     ToolTip = 'Executes the &Beneficiary action.';
                // }
                // action("&Emergency Contacts")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Emergency Contacts';
                //     Image = ContactPerson;
                //     RunObject = Page "Apptitude Interview Lines";
                //     //RunPageLink = "Line No" = field("No.");
                //     Visible = false;
                //     ToolTip = 'Executes the &Emergency Contacts action.';
                // }
                action("Mi&sc. Article Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mi&sc. Article Information';
                    Image = Filed;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Mi&sc. Article Information action.';
                }
                action("&Confidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = '&Confidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Confidential Information action.';
                }
                // action("&Medical Info")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Medical Info';
                //     Image = Lock;
                //     RunObject = Page "Vacancy Media Advertisements";
                //     //RunPageLink = "Entry No." = field("No.");
                //     Visible = false;
                //     ToolTip = 'Executes the &Medical Info action.';
                // }
                // action("R&esponsibilities")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'R&esponsibilities';
                //     Image = Position;
                //     RunObject = Page "Welfare Contribution Header";
                //     RunPageLink = "Welfare No." = field(Position);
                //     Visible = false;
                //     ToolTip = 'Executes the R&esponsibilities action.';
                // }


                action("Q&ualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Q&ualifications action.';
                }
                // action("Employment H&istory")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employment H&istory';
                //     Image = History;
                //     RunObject = Page "Oral Interview  List";
                //     //      RunPageLink = "Line No." = field("No.");
                //     Visible = false;
                //     ToolTip = 'Executes the Employment H&istory action.';
                // }
                // action("Employee Referees")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employee Referees';
                //     Image = History;
                //     RunObject = Page "Employee Referees";
                //     //   RunPageLink = Field8 = field("No.");
                //     Visible = false;
                //     ToolTip = 'Executes the Employee Referees action.';
                // }
                // action("I&tems Assigned")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'I&tems Assigned';
                //     Image = CheckList;
                //     RunObject = Page "Oral Interview Card";
                //     //   RunPageLink = "Line No." = field("No.");
                //     Visible = false;
                //     ToolTip = 'Executes the I&tems Assigned action.';
                // }
                // action("C&onfidential Info")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'C&onfidential Info';
                //     Image = ConfidentialOverview;
                //     RunObject = Page "Job Advertisement Templates";
                //     RunPageLink = Code = field("No.");
                //     Visible = false;
                //     ToolTip = 'Executes the C&onfidential Info action.';
                // }
                action("A&bsences")
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    Image = Absence;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the A&bsences action.';
                }
                separator(Action23)
                {
                }
                action("Absences by Ca&tegories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Absences by Ca&tegories';
                    Image = AbsenceCategory;
                    RunObject = Page "Empl. Absences by Categories";
                    RunPageLink = "No." = field("No."),
                                  "Employee No. Filter" = field("No.");
                    ToolTip = 'Executes the Absences by Ca&tegories action.';
                }
                action("Misc. Articles &Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page "Misc. Articles Overview";
                    ToolTip = 'Executes the Misc. Articles &Overview action.';
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                    ToolTip = 'Executes the Co&nfidential Info. Overview action.';
                }
                separator(Action61)
                {
                }
                action("Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;
                    ToolTip = 'Executes the Online Map action.';
                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
                action("Create Customer Imprest A/C")
                {
                    ApplicationArea = Basic;
                    Enabled = ShowCust;
                    Image = Customer;
                    ToolTip = 'Executes the Create Customer Imprest A/C action.';
                    trigger OnAction()
                    var
                        Cust: Record Customer;
                    begin
                        // if Rec.CreateCustomer then
                        //     Message(Text000, 'Imprest A/C')
                        // else
                        //     Message(Text001, 'Imprest A/C');
                    end;
                }
                action("Create Resource A/C")
                {
                    ApplicationArea = Basic;
                    Enabled = ShowResource;
                    Image = Resource;
                    ToolTip = 'Executes the Create Resource A/C action.';
                    trigger OnAction()
                    begin
                        // if Rec.CreateResource then
                        //     Message(Text000, 'Resource')
                        // else
                        //     Message(Text001, 'Resource');
                    end;
                }
                // action(Attachments)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Attachments';
                //     Image = Attachments;
                //     Promoted = true;
                //     PromotedCategory = Category6;
                //     RunObject = Page "Attachments Setup";
                //     RunPageLink = Code = field("No.");
                //     ToolTip = 'Executes the Attachments action.';
                // }



                // action("Performance Appraisal History")
                // {
                //     ApplicationArea = Basic;
                //     Image = History;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     ToolTip = 'Executes the Performance Appraisal History action.';
                //     RunObject = Page "Performance Appraisal History";
                //     RunPageLink = "Employee No." = field("No.");
                // }


            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Create Customer Imprest A/C_Promoted"; "Create Customer Imprest A/C")
                {
                }
                actionref("Create Resource A/C_Promoted"; "Create Resource A/C")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // ShowCust := Rec.CreateCustomer;
        // ShowResource := Rec.CreateResource;
    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
        ExitDateEditable := true;
        ExitByEditable := true;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        if UserRec.get(UserId) then begin
            if UserRec."Can View HR" = false then
                Error('You do not have rights to access the employee list');
            Kudade := UserRec."Direct Edit Employee Records";

        end else
            Error('You do not have rights to access the employee list');
        // ShowCust := Rec.CreateCustomer;
        // ShowResource := Rec.CreateResource;
        IF Rec."Date Of Birth" <> 0D then
            Rec.Validate("Date Of Birth");
        Rec."Date Filter" := Today;
        if Rec."Pension Scheme Join" <> 0D then begin
            if Rec."Date Of Leaving" <> 0D then begin
                TimeinPension := HRDates.DetermineAge(Rec."Pension Scheme Join", Rec."Date Of Leaving");
            end else begin
                TimeinPension := HRDates.DetermineAge(Rec."Pension Scheme Join", Today);
            end;
        end;
    end;

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin
        if CloseAction in [Action::OK, Action::LookupOK] then begin
            if Rec."No." <> '' then begin
                //Rec.TestField("Mobile Phone No.");
                // Rec.TestField(Address);
                // Rec.TestField("Address 2");
            end;
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Record Type" := Rec."Record Type"::Employee;
        Rec."Employee Category Type" := Rec."Employee Category Type"::"...";
    end;

    var

        MapPointVisible: Boolean;

        ShowCust: Boolean;

        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';

        ExitDateEditable: Boolean;

        ExitByEditable: Boolean;
        Emp: Record Employee;

        UserRec: Record "User Setup";
        TimeinPension: Text[50];
        HRDates: Codeunit "HR Dates";
        Kudade: Boolean;


    procedure Updatecontrols()
    begin

        // if Rec."Exit Interview Conducted" = Rec."exit interview conducted"::Yes then begin
        //     ExitByEditable := true;
        //     ExitDateEditable := true;
        // end else begin
        //     ExitByEditable := false;
        //     ExitDateEditable := false;
        // end;
    end;
}

#pragma implicitwith restore

