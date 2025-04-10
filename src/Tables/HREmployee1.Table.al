Table 52193763 "HR Employee1"
{
    Caption = 'Employee';
    DataCaptionFields = "No.", "First Name", "Middle Name", "Last Name", "Job Title", "Search Name";
    DrillDownPageID = "HR Employee List";
    LookupPageID = "HR Employee List";

    fields
    {
        field(1; "No."; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                /*
                IF "No." <> xRec."No." THEN BEGIN
                  HumanResSetup.GET;
                  NoSeriesMgt.TestManual(HumanResSetup."Employee Nos.");
                  "No. Series" := '';
                END;
                */
                //This is for staff to Library Dataport don't Delete!
                if "No." <> '' then
                    Category := 'STAFF';

            end;
        }
        field(2; "First Name"; Text[80])
        {
        }
        field(3; "Middle Name"; Text[50])
        {
        }
        field(4; "Last Name"; Text[50])
        {

            trigger OnValidate()
            var
                Reason: Text[30];
            begin
                if (("Last Name" <> xRec."Last Name") and (xRec."Last Name" <> '')) then begin
                    CareerEvent.SetMessage('Changing Surname in Career History');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory.Init;
                        CareerHistory.Reason := CareerEvent.ReturnReason;
                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Surname Changed';
                        CareerHistory."Last Name" := "Last Name";
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(5; Initials; Text[15])
        {

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Initials)) or ("Search Name" = '') then
                    "Search Name" := Initials;
            end;
        }
        field(7; "Search Name"; Code[50])
        {
        }
        field(8; "Postal Address"; Text[80])
        {
        }
        field(9; "Residential Address"; Text[80])
        {
        }
        field(10; City; Text[30])
        {

            trigger OnValidate()
            begin
                if (City <> xRec.City) then begin
                    CareerEvent.SetMessage('Location Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory.Init;
                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Location Changed';
                        CareerHistory.Location := City;
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(11; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if PostCode.Get("Post Code") then
                    City := PostCode.City;
                if ((City <> xRec.City) and (xRec.City <> '')) then begin
                    CareerEvent.SetMessage('Location Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory.Init;
                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Location Changed';
                        CareerHistory.Location := City;
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(12; County; Text[30])
        {
        }
        field(13; "Home Phone Number"; Text[30])
        {
        }
        field(14; "Cellular Phone Number"; Text[30])
        {
        }
        field(15; "Work Phone Number"; Text[30])
        {
        }
        field(16; "Ext."; Text[7])
        {
        }
        field(17; "E-Mail"; Text[80])
        {
        }
        field(19; Picture; Blob)
        {
            SubType = Bitmap;
        }
        field(21; "ID Number"; Text[30])
        {
        }
        field(22; "Union Code"; Code[10])
        {
            TableRelation = Union;
        }
        field(23; "UIF Number"; Text[30])
        {
        }
        field(24; Gender; Option)
        {
            OptionMembers = Female,Male;
        }
        field(25; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(28; "Statistics Group Code"; Code[10])
        {
            TableRelation = "Employee Statistics Group";
        }
        field(31; Status; Option)
        {
            OptionMembers = Normal,Resigned,Discharged,Retrenched,Pension,Disabled;

            trigger OnValidate()
            begin
                if (Status <> xRec.Status) then begin
                    if (Status = Status::Disabled) then
                        Disabled := Disabled::Yes;

                    CareerEvent.SetMessage('Status Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory.Init;
                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Status Changed';
                        CareerHistory.Status := Status;
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(36; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));

            trigger OnValidate()
            begin
                /*
                 { IF (("Department Code" <> xRec."Department Code") AND (xRec."Department Code" <> '')) THEN BEGIN
                      CareerEvent.SetMessage('Department Changed');
                      CareerEvent.RUNMODAL;
                      OK:= CareerEvent.ReturnResult;
                       IF OK THEN BEGIN
                          IF NOT CareerHistory.FIND('-') THEN
                           CareerHistory."Line No.":=1
                         ELSE BEGIN
                           CareerHistory.FIND('+');
                           CareerHistory."Line No.":=CareerHistory."Line No."+1;
                         END;
                          CareerHistory.INIT;
                          CareerHistory."Employee No.":= "No.";
                          CareerHistory."Date Of Event":= WORKDATE;
                          CareerHistory."Career Event":= 'Department Changed';
                          CareerHistory.Department:="Department Code";
                          CareerHistory."Employee First Name":= "Known As";
                          CareerHistory."Employee Last Name":= "Last Name";
                          CareerHistory.INSERT;
                       END;
                     //  Code below commented by Linus
                      {
                       IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                         EmployeeResUpdate.ResUpdate(Rec)
                      }
                   END;
                }
               //Added to change dept on employee table and assignment matrix table
               //employee payroll
               IF Payroll.GET("No.") THEN BEGIN
               Payroll."Department Code":="Department Code";
               Payroll.MODIFY;
               END;

               //
                GetPayPeriod;
               // "Payroll Period":=PayStartDate;
               //  "Pay Period":=PayPeriodText;

               //Employee No,Type,Code,Payroll Period,Department Code


               AssMatrix.RESET;
               AssMatrix.SETRANGE(AssMatrix."Employee No","No.");
               AssMatrix.SETRANGE("Payroll Period",PayStartDate);
               IF AssMatrix.FIND('-') THEN BEGIN
                REPEAT
                 AssMatrixTemp.TRANSFERFIELDS(AssMatrix);
                 AssMatrixTemp."Department Code":="Department Code";
                 AssMatrixTemp.INSERT;
                 AssMatrix.DELETE;
                UNTIL AssMatrix.NEXT=0;
               END;


               AssMatrixTemp.RESET;
               AssMatrixTemp.SETRANGE(AssMatrixTemp."Employee No","No.");
               AssMatrixTemp.SETRANGE("Payroll Period",PayStartDate);
               IF AssMatrixTemp.FIND('-') THEN BEGIN
                REPEAT
                 AssMatrix.TRANSFERFIELDS(AssMatrixTemp);
                 //AssMatrix."Department Code":="Department Code";
                 AssMatrix.INSERT;
                AssMatrixTemp.DELETE;
                UNTIL AssMatrixTemp.NEXT=0;
               END;
                */

            end;
        }
        field(37; Office; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRANCH'));

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                //  EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(38; "Resource No."; Code[20])
        {
            TableRelation = Resource;

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                //  EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(39; Comment; Boolean)
        {
            CalcFormula = exist("HR Human Resource Comments1" where("Table Name" = const(Employee),
                                                                     "No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(41; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(42; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(43; "Office Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(47; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(49; "Fax Number"; Text[30])
        {
        }
        field(50; "Company E-Mail"; Text[80])
        {
        }
        field(51; Title; Option)
        {
            OptionMembers = MR,MRS,MISS,MS,DR,"  ",CC;

            trigger OnValidate()
            begin
                if (Title <> xRec.Title) then begin
                    CareerEvent.SetMessage('Title Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory.Init;
                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Title Changed';
                        CareerHistory.Title := Title;
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(52; "Salespers./Purch. Code"; Code[10])
        {

            trigger OnValidate()
            begin
                //IF ("Salespers./Purch. Code" <> '') AND SalespersonPurchaser.WRITEPERMISSION THEN
                //  EmployeeSalespersonUpdate.SalesPersonUpdate(Rec)
            end;
        }
        field(53; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(54; "Known As"; Text[30])
        {

            trigger OnValidate()
            begin
                if (("Known As" <> xRec."Known As") and (xRec."Known As" <> '')) then begin
                    CareerEvent.SetMessage('Changing First Name in Career History');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        CareerHistory.Init;
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory.Reason := CareerEvent.ReturnReason;
                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Surname Changed';
                        CareerHistory."Last Name" := "Last Name";
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";

                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(55; Position; Text[30])
        {
            //TableRelation = Table50050;

            trigger OnValidate()
            begin
                /*
                    IF ((Position <> xRec.Position) AND (xRec.Position <> '')) THEN BEGIN
                      Jobs.RESET;
                      Jobs.SETRANGE(Jobs."Job ID",Position);
                      IF Jobs.FIND('-') THEN BEGIN
                          Payroll.RESET;
                          Payroll.SETRANGE(Payroll.Code,"No.");
                          IF Payroll.FIND('-') THEN BEGIN
                              Payroll."Salary Scheme Category":=Jobs.Category;
                              Payroll."Salary Steps":=Jobs.Grade;
                              Payroll.VALIDATE(Payroll."Salary Steps");
                              Payroll.MODIFY;
                          END
                      END



                        {
                      CareerEvent.SetMessage('Job Title Changed');
                     CareerEvent.RUNMODAL;
                     OK:= CareerEvent.ReturnResult;
                      IF OK THEN BEGIN
                         CareerHistory.INIT;
                         IF NOT CareerHistory.FIND('-') THEN
                          CareerHistory."Line No.":=1
                        ELSE BEGIN
                          CareerHistory.FIND('+');
                          CareerHistory."Line No.":=CareerHistory."Line No."+1;
                        END;

                         CareerHistory."Employee No.":= "No.";
                         CareerHistory."Date Of Event":= WORKDATE;
                         CareerHistory."Career Event":= 'Job Title Changed';
                         CareerHistory."Job Title":= "Position Title";
                         CareerHistory."Employee First Name":= "Known As";
                         CareerHistory."Employee Last Name":= "Last Name";
                         CareerHistory.INSERT;
                      END;
                      }

                  END;
               */

            end;
        }
        field(57; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time";

            trigger OnValidate()
            begin
                if ("Full / Part Time" <> xRec."Full / Part Time") then begin
                    CareerEvent.SetMessage('Full / Part Time Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        CareerHistory.Init;
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Full / Part Time Changed';
                        CareerHistory."Full/Part Time" := "Full / Part Time";
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(58; "Contract Type"; Code[20])
        {
            //TableRelation = Table52236.Field1;
        }
        field(59; "Contract End Date"; Date)
        {
        }
        field(60; "Notice Period"; Code[10])
        {
            //TableRelation = Table52001.Field1;
        }
        field(61; "Union Member?"; Boolean)
        {
        }
        field(62; "Shift Worker?"; Boolean)
        {
        }
        field(63; "Contracted Hours"; Decimal)
        {
        }
        field(64; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly," ";
        }
        field(65; "Pay Per Period"; Decimal)
        {
        }
        field(66; "Cost Code"; Code[10])
        {
            //TableRelation = Table52003;

            trigger OnValidate()
            begin
                CurrentPayDetails;
            end;
        }
        field(68; "PAYE Number"; Text[30])
        {
        }
        field(69; "UIF Contributor?"; Boolean)
        {
        }
        field(73; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;

            trigger OnValidate()
            begin
                if ("Marital Status" <> xRec."Marital Status") then begin
                    CareerEvent.SetMessage('Marital Status Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        CareerHistory.Init;
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Marital Status Changed';
                        CareerHistory."Marital Status" := "Marital Status";
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(74; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;

            trigger OnValidate()
            begin
                /*
                EmployeeEquity.SETRANGE("Employee No.","No.");
                OK:= EmployeeEquity.FIND('-');
                IF OK THEN BEGIN
                  EmployeeEquity."Ethnic Origin":= "Ethnic Origin";
                  EmployeeEquity.MODIFY;
                END;
                   */

            end;
        }
        field(75; "First Language (R/W/S)"; Code[10])
        {
            //TableRelation = Table52005;
        }
        field(76; "Driving Licence"; Code[10])
        {
            //TableRelation = Table52006;
        }
        field(77; "Vehicle Registration Number"; Code[10])
        {

            trigger OnValidate()
            begin
                if ("Vehicle Registration Number" <> xRec."Vehicle Registration Number") and ("Vehicle Registration Number" <> '') then begin
                    CareerEvent.SetMessage('Vehicle Registration Number Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        CareerHistory.Init;
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Vehicle Registration Number Changed';
                        CareerHistory."Vehicle Registration" := "Vehicle Registration Number";
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(78; Disabled; Option)
        {
            OptionMembers = No,Yes," ";

            trigger OnValidate()
            begin
                if (Disabled = Disabled::Yes) then
                    Status := Status::Disabled;
            end;
        }
        field(79; "Health Assesment?"; Boolean)
        {
        }
        field(80; "Health Assesment Date"; Date)
        {
        }
        field(81; "Date Of Birth"; Date)
        {
        }
        field(82; Age; Text[80])
        {
        }
        field(83; "Date Of Join"; Date)
        {

            trigger OnValidate()
            begin
                Age := Dates.DetermineAge("Date Of Birth", "Date Of Join");
                if ("Date Of Leaving" <> 0D) and ("Date Of Join" <> 0D) then
                    "Length Of Service" := Dates.DetermineAge("Date Of Join", "Date Of Leaving");

                //    IF ("Date Of Join" <> 0D) THEN BEGIN
                //       CareerEvent.SetMessage('Joined The Company');
                //       CareerEvent.RUNMODAL;
                //       OK:= CareerEvent.ReturnResult;
                //        IF OK THEN BEGIN
                //           CareerHistory.INIT;
                //           CareerHistory."Employee No.":= "No.";
                //           CareerHistory."Date Of Event":= "Date Of Join";
                //           CareerHistory."Career Event":= 'Joined The Company';
                //           CareerHistory.Joined:= TRUE;
                //           CareerHistory."Employee First Name":= "Known As";
                //           CareerHistory."Employee Last Name":= "Last Name";
                //           CareerHistory.INSERT;
                //        END;
                //    END;
            end;
        }
        field(84; "Length Of Service"; Text[80])
        {
        }
        field(85; "End Of Probation Date"; Date)
        {
        }
        field(86; "Pension Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                if ("Date Of Leaving" <> 0D) and ("Pension Scheme Join" <> 0D) then
                    "Time Pension Scheme" := Dates.DetermineAge("Pension Scheme Join", "Date Of Leaving");
            end;
        }
        field(87; "Time Pension Scheme"; Text[80])
        {
        }
        field(88; "Medical Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                if ("Date Of Leaving" <> 0D) and ("Medical Scheme Join" <> 0D) then
                    "Time Medical Scheme" := Dates.DetermineAge("Medical Scheme Join", "Date Of Leaving");
            end;
        }
        field(89; "Time Medical Scheme"; Text[80])
        {
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(90; "Date Of Leaving"; Date)
        {

            trigger OnValidate()
            begin
                if ("Date Of Join" <> 0D) and ("Date Of Leaving" <> 0D) then
                    "Length Of Service" := Dates.DetermineAge("Date Of Join", "Date Of Leaving");
                if ("Pension Scheme Join" <> 0D) and ("Date Of Leaving" <> 0D) then
                    "Time Pension Scheme" := Dates.DetermineAge("Pension Scheme Join", "Date Of Leaving");
                if ("Medical Scheme Join" <> 0D) and ("Date Of Leaving" <> 0D) then
                    "Time Medical Scheme" := Dates.DetermineAge("Medical Scheme Join", "Date Of Leaving");


                if ("Date Of Leaving" <> 0D) and ("Date Of Leaving" <> xRec."Date Of Leaving") then begin
                    /*
                     ExitInterviews.SETRANGE("Employee No.","No.");
                    OK:= ExitInterviews.FIND('-');
                    IF OK THEN BEGIN
                      ExitInterviews."Date Of Leaving":= "Date Of Leaving";
                      ExitInterviews.MODIFY;
                    END;
                    */
                    Commit();
                end;


                if ("Date Of Leaving" <> 0D) and ("Date Of Leaving" <> xRec."Date Of Leaving") then begin
                    CareerEvent.SetMessage('Left The Company');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        CareerHistory.Init;
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := "Date Of Leaving";
                        CareerHistory."Career Event" := 'Left The Company';
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";

                        CareerHistory.Insert;
                    end;
                end;

            end;
        }
        field(91; Paterson; Code[10])
        {
            //TableRelation = Table52122.Field2;
        }
        field(92; Peromnes; Code[10])
        {
            //TableRelation = Table52007;
        }
        field(93; Hay; Code[10])
        {
            //TableRelation = Table52124.Field2;
        }
        field(94; Castellion; Code[10])
        {
            //TableRelation = Table52123.Field2;
        }
        field(95; "Per Annum"; Decimal)
        {
        }
        field(96; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
        }
        field(97; "Medical Scheme No."; Text[30])
        {

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
                // OK := MedicalAidBenefit.FIND('+');
                //IF OK THEN BEGIN
                // REPEAT
                //  MedicalAidBenefit."Medical Aid Number":= "Medical Aid Number";
                //   MedicalAidBenefit.MODIFY;
                //   COMMIT();
                //UNTIL MedicalAidBenefit.NEXT = 0;
                // END;

                if ("Medical Scheme No." <> xRec."Medical Scheme No.") and ("Medical Scheme No." <> '') then begin
                    CareerEvent.SetMessage('Medical Aid Number Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        CareerHistory.Init;
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := WorkDate;
                        CareerHistory."Career Event" := 'Medical Aid Number Changed';
                        CareerHistory."Medical Aid Number" := "Medical Scheme No.";
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(98; "Medical Scheme Head Member"; Text[60])
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //   OK := MedicalAidBenefit.FIND('+');
                //  IF OK THEN BEGIN
                //  REPEAT
                //   MedicalAidBenefit."Medical Aid Head Member":= "Medical Aid Head Member";
                //    MedicalAidBenefit.MODIFY;
                //  UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(99; "Number Of Dependants"; Integer)
        {

            trigger OnValidate()
            begin
                // MedicalAidBenefit.SETRANGE("Employee No.","No.");
                // OK := MedicalAidBenefit.FIND('+');
                // IF OK THEN BEGIN
                //REPEAT
                //  MedicalAidBenefit."Number Of Dependants":= "Number Of Dependants";
                //  MedicalAidBenefit.MODIFY;
                //UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(100; "Medical Scheme Name"; Text[150])
        {
            //TableRelation = Table52263.Field1;

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //OK := MedicalAidBenefit.FIND('+');
                //IF OK THEN BEGIN
                // REPEAT
                // MedicalAidBenefit."Medical Aid Name":= "Medical Aid Name";
                //  MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(101; "Amount Paid By Employee"; Decimal)
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //  OK := MedicalAidBenefit.FIND('+');
                //   IF OK THEN BEGIN
                //     REPEAT
                //      MedicalAidBenefit."Amount Paid By Employee":= "Amount Paid By Employee";
                //       MedicalAidBenefit.MODIFY;
                //     UNTIL MedicalAidBenefit.NEXT = 0;
                //    END;
            end;
        }
        field(102; "Amount Paid By Company"; Decimal)
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //   OK := MedicalAidBenefit.FIND('+');
                //  IF OK THEN BEGIN
                // REPEAT
                //      MedicalAidBenefit."Amount Paid By Company":= "Amount Paid By Company";
                //      MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                //   END;
            end;
        }
        field(103; "Receiving Car Allowance ?"; Boolean)
        {
        }
        field(104; "Second Language (R/W/S)"; Code[10])
        {
            //TableRelation = Table52005.Field1;
        }
        field(105; "Additional Language"; Code[10])
        {
            //TableRelation = Table52005.Field1;
        }
        field(106; "Cell Phone Reimbursement?"; Boolean)
        {
        }
        field(107; "Amount Reimbursed"; Decimal)
        {
        }
        field(108; "UIF Country"; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(109; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
        }
        field(110; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                //  EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(111; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                //  EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(112; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
                //**Added by ACR 12/08/2002
                //**Block resource if Terminated

                if "Resource No." <> '' then begin
                    OK := "Lrec Resource".Get("Resource No.");
                    "Lrec Resource".Blocked := true;
                    "Lrec Resource".Modify;
                end;

                //**
            end;
        }
        field(113; "Job Specification"; Code[30])
        {
        }
        field(114; DateOfBirth; Text[8])
        {
        }
        field(115; DateEngaged; Text[8])
        {
        }
        field(116; "Postal Address2"; Text[30])
        {
        }
        field(117; "Postal Address3"; Text[20])
        {
        }
        field(118; "Residential Address2"; Text[30])
        {
        }
        field(119; "Residential Address3"; Text[20])
        {
        }
        field(120; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(121; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(122; "Name Of Manager"; Text[45])
        {
        }
        field(123; "User ID"; Code[50])
        {
            TableRelation = User.State;
            //This property is currently not supported
            //TestTableRelation = true;

            trigger OnValidate()
            begin

                //IF ("User ID" <> '') AND User.WRITEPERMISSION THEN
                // EmployeeResUpdate.UserUpdate(Rec)
            end;
        }
        field(124; "Disabling Details"; Text[50])
        {
        }
        field(125; "Disability Grade"; Text[30])
        {
        }
        field(126; "Passport Number"; Text[30])
        {
        }
        field(127; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(128; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(129; PensionJoin; Text[8])
        {
        }
        field(130; DateLeaving; Text[30])
        {
        }
        field(131; Region; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('REGION'));
        }
        field(132; "Manager Emp No"; Code[30])
        {
        }
        field(133; Temp; Text[200])
        {
        }
        field(134; "Employee Qty"; Integer)
        {
            CalcFormula = count(Employee);
            FieldClass = FlowField;
        }
        field(135; "Employee Act. Qty"; Integer)
        {
            CalcFormula = count("HR Employee1" where("Termination Category" = filter(= " ")));
            FieldClass = FlowField;
        }
        field(136; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = count("HR Employee1" where("Termination Category" = filter(<> " ")));
            FieldClass = FlowField;
        }
        field(137; "Contract Location"; Text[20])
        {
            Description = 'Location where contract was closed';
        }
        field(138; "First Language Read"; Boolean)
        {
        }
        field(139; "First Language Write"; Boolean)
        {
        }
        field(140; "First Language Speak"; Boolean)
        {
        }
        field(141; "Second Language Read"; Boolean)
        {
        }
        field(142; "Second Language Write"; Boolean)
        {
        }
        field(143; "Second Language Speak"; Boolean)
        {
        }
        field(144; "Custom Grading"; Code[10])
        {
            //TableRelation = Table52125.Field2;
        }
        field(145; "PIN Number"; Code[20])
        {
        }
        field(146; "NSSF No."; Code[20])
        {
        }
        field(147; "NHIF No."; Code[20])
        {
        }
        field(148; "Cause of Inactivity Code"; Code[10])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(149; "Grounds for Term. Code"; Code[10])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
        }
        field(150; "PAYROLL NO"; Code[10])
        {
        }
        field(151; "Period Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            //TableRelation = Table52213.Field1;
        }
        field(152; "HELB No"; Text[30])
        {
        }
        field(153; "Co-Operative No"; Text[30])
        {
        }
        field(154; "Wedding Anniversary"; Date)
        {
        }
        field(155; "KPA Code"; Code[20])
        {
            // FieldClass = FlowFilter;
            // //TableRelation = Table52214.Field3 where (Field1=field("No."),
            // Field2 =field("Period Filter"));
        }
        field(156;"Competency Area";Code[20])
        {
            // FieldClass = FlowFilter;
            // //TableRelation = Table52215.Field3 where (Field1=field("No."),
            //                                          Field2=field("Period Filter"));
        }
        field(157;"Cost Center Code";Code[10])
        {
            TableRelation = "Dimension Value".Code where ("Dimension Code"=const('COURSE'));
        }
        field(158;"Position To Succeed";Code[20])
        {
            //TableRelation = Table50050.Field1;

            trigger OnValidate()
            begin
                /*SuccessionGap.RESET;
                SuccessionGap.SETRANGE(SuccessionGap."Employee No","No.");
                IF SuccessionGap.FIND('-') THEN
                SuccessionGap.DELETEALL;
                
                JobReq.RESET;
                JobReq.SETRANGE(JobReq."Job Id","Position To Succeed");
                IF JobReq.FIND('-') THEN
                BEGIN
                REPEAT
                IF NOT EmpQualification.GET("No.",JobReq."Qualification Code") THEN
                BEGIN
                SuccessionGap.INIT;
                SuccessionGap."Employee No":="No.";
                SuccessionGap."Job Id":=JobReq."Job Id";
                SuccessionGap."Qualification Type":=JobReq."Qualification Type";
                SuccessionGap."Qualification Code":=JobReq."Qualification Code";
                SuccessionGap.Qualification:=JobReq.Qualification;
                SuccessionGap.Priority:=JobReq.Priority;
                SuccessionGap.INSERT;
                END;
                UNTIL JobReq.NEXT = 0;
                END;
                 */

            end;
        }
        field(159;"Succesion Date";Date)
        {
        }
        field(160;"Send Alert to";Code[20])
        {
            //TableRelation = Table52000.Field1;
        }
        field(161;Tribe;Code[20])
        {
            //TableRelation = Table52139.Field1;
        }
        field(162;Religion;Code[20])
        {
            //TableRelation = Table63003.Field1;
        }
        field(163;"Job Title";Text[50])
        {
        }
        field(164;"Post Office No";Text[100])
        {
        }
        field(165;"Posting Group";Code[50])
        {
            NotBlank = true;
            //TableRelation = Table52253.Field1;
        }
        field(166;"Payroll Posting Group";Code[10])
        {
            //TableRelation = Table50011.Field1;
        }
        field(167;"Served Notice Period";Boolean)
        {
        }
        field(168;"Exit Interview Date";Date)
        {
        }
        field(169;"Exit Interview Done by";Code[20])
        {
            //TableRelation = Table52000.Field1;
        }
        field(170;"Allow Re-Employment In Future";Boolean)
        {
        }
        field(171;"Medical Scheme Name #2";Text[150])
        {
            //TableRelation = Table52263.Field1;

            trigger OnValidate()
            begin
                         //MedicalAidBenefit.SETRANGE("Employee No.","No.");
                         //OK := MedicalAidBenefit.FIND('+');
                       //IF OK THEN BEGIN
                         // REPEAT
                          // MedicalAidBenefit."Medical Aid Name":= "Medical Aid Name";
                         //  MedicalAidBenefit.MODIFY;
                         // UNTIL MedicalAidBenefit.NEXT = 0;
                       // END;
            end;
        }
        field(172;"Resignation Date";Date)
        {
        }
        field(173;"Suspension Date";Date)
        {
        }
        field(174;"Demised Date";Date)
        {
        }
        field(175;"Retirement date";Date)
        {
        }
        field(176;"Retrenchment date";Date)
        {
        }
        field(177;Campus;Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Dimension Code"=const('CAMPUS'));
        }
        field(178;Permanent;Boolean)
        {

            trigger OnValidate()
            begin
                //Helps Filter Permanent and Casual employees
                /*
                IF Payroll.GET("No.") THEN BEGIN
                Payroll.Permanent:=Permanent;
                Payroll.MODIFY;
                END;
                */

            end;
        }
        field(179;"Library Category";Option)
        {
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS;
        }
        field(180;Category;Code[10])
        {
        }
        field(181;"Payroll Departments";Code[10])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                //Added to change dept on employee table and assignment matrix table
                //employee payroll
                /*
                IF Payroll.GET("No.") THEN BEGIN
                Payroll."Department Code":="Payroll Departments";
                Payroll.MODIFY;
                END;
                  */

            end;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
        key(Key2;"First Name")
        {
        }
        key(Key3;"Last Name")
        {
        }
        key(Key4;"ID Number")
        {
        }
        key(Key5;"Known As")
        {
        }
        key(Key6;"User ID")
        {
        }
        key(Key7;"Cost Code")
        {
        }
        key(Key8;"Date Of Join","Date Of Leaving")
        {
        }
        key(Key9;"Termination Category")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //EmployeeImages.SETRANGE("Employee No.","No.");
        //EmployeeImages.DELETEALL;

        //EmployeeNotes.SETRANGE("Employee No.","No.");
        //EmployeeNotes.DELETEALL;

        EmployeeRelative.SetRange("Employee No.","No.");
        EmployeeRelative.DeleteAll;

        //VehicleUsage.SETRANGE("Employee No.","No.");
        //VehicleUsage.DELETEALL;

        CorrespondHistory.SetRange("Employee No.","No.");
        CorrespondHistory.DeleteAll;

        //EmployeeEquity.SETRANGE("Employee No.","No.");
        //EmployeeEquity.DELETEALL;

        HumanResComment.SetRange("No.","No.");
        HumanResComment.DeleteAll;

        //AssignAbsence.SETRANGE("Employee No.","No.");
        //AssignAbsence.DELETEALL;

        //AbsenceHoliday.SETRANGE("Employee No.","No.");
        //AbsenceHoliday.DELETEALL;

        //EmployeePayment.SETRANGE("Employee No.","No.");
        //EmployeePayment.DELETEALL;

        //EmployeeBankDetails.SETRANGE("Employee No.","No.");
        //EmployeeBankDetails.DELETEALL;

        //EmployeeMaternity.SETRANGE("Employee No.","No.");
        //EmployeeMaternity.DELETEALL;

        //SAQATrainingHistory.SETRANGE("Employee No.","No.");
        //SAQATrainingHistory.DELETEALL;

        EmploymentHistory.SetRange("Employee No.","No.");
        EmploymentHistory.DeleteAll;

        //MedicalHistory.SETRANGE("Employee No.","No.");
        //MedicalHistory.DELETEALL;

        CareerHistory.SetRange("Employee No.","No.");
        CareerHistory.DeleteAll;

        //Appraisal.SETRANGE("Employee No.","No.");
        //Appraisal.DELETEALL;

        //Disciplinary.SETRANGE("Employee No.","No.");
        //Disciplinary.DELETEALL;

        //ExitInterviews.SETRANGE("Employee No.","No.");
        //ExitInterviews.DELETEALL;

        //Grievances.SETRANGE("Employee No.","No.");
        //Grievances.DELETEALL;

        //Appraisal.SETRANGE("Employee No.","No.");
        //Appraisal.DELETEALL;

        //MedicalAidBenefit.SETRANGE("Employee No.","No.");
        //MedicalAidBenefit.DELETEALL;

        //PensionBenefit.SETRANGE("Employee No.","No.");
        //PensionBenefit.DELETEALL;

        //CarBenefit.SETRANGE("Employee No.","No.");
        //CarBenefit.DELETEALL;

        //SAQATraining.SETRANGE("Employee No.","No.");
        //SAQATraining.DELETEALL;

        //LearningIntervention.SETRANGE("Employee No.","No.");
        //LearningIntervention.DELETEALL;

        ExistingQualification.SetRange("Employee No.","No.");
        ExistingQualification.DeleteAll;

        ProfessionalMembership.SetRange("Employee No.","No.");
        ProfessionalMembership.DeleteAll;

        EducationAssistance.SetRange("Employee No.","No.");
        EducationAssistance.DeleteAll;

        //InformalTraining.SETRANGE("Employee No.","No.");
        //InformalTraining.DELETEALL;

        //EmployeeSkillsLines.SETRANGE("Employee No.","No.");
        //EmployeeSkillsLines.DELETEALL;

        //EmployeeSkillsPlan.SETRANGE("Employee No.","No.");
        //EmployeeSkillsPlan.DELETEALL;
    end;

    trigger OnInsert()
    begin
        /*
        IF "No." = '' THEN BEGIN
          HumanResSetup.GET;
          HumanResSetup.TESTFIELD("Employee Nos.");
          NoSeriesMgt.InitSeries(HumanResSetup."Employee Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;
        
        IF "No." <> xRec."No." THEN BEGIN
          HumanResSetup.GET;
          HumanResSetup.TESTFIELD("Employee Nos.");
          NoSeriesMgt.TestManual(HumanResSetup."Employee Nos.");
          "No. Series" := '';
        END;
        */
        
        //CurrentPayDetails;

    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
        //IF Res.READPERMISSION THEN
        //  EmployeeResUpdate.HumanResToRes(xRec,Rec);
        //IF SalespersonPurchaser.READPERMISSION THEN
        //  EmployeeSalespersonUpdate.HumanResToSalesPerson(xRec,Rec);
         CurrentPayDetails;
        /*
        IF ("Department Code" <> xRec."Department Code") OR
          (Office <> xRec.Office)
        THEN
        //  UpdtResUsersetp.OnModify(Rec);
          UpdtResUsersetp(Rec);
          */

    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        PMEmployee: Record "HR Employee1";
        Res: Record Resource;
        PostCode: Record "Post Code";
        EmployeeRelative: Record "Employee Relative";
        CorrespondHistory: Record "Employment History1";
        HumanResComment: Record "HR Human Resource Comments1";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Dates: Codeunit "HR Dates";
        OK: Boolean;
        EmploymentHistory: Record "Employment History1";
        MedicalHistory: Record "Medical History1";
        CareerHistory: Record "HR Career History1";
        Appraisal: Record "Employee Appraisals1";
        Disciplinary: Record "Employee Disciplinary Cases1";
        CareerEvent: Page "HR Career Event Option Box";
                         ExistingQualification: Record "Employee Qualification";
                         ProfessionalMembership: Record "HR Professional Membership1";
                         EducationAssistance: Record "HR Education Assistance1";
                         User: Record "User Setup";
                         ERROR1: label 'Employee Career History Starting Information already exist.';
        MSG1: label 'Employee Career History Starting Information successfully created.';
        ReasonDiaglog: Dialog;
        Jobs: Record "Company Jobsx1";
        JobReq: Record "Job Requirement1";
        EmpQualification: Record "Employee Qualification";
        AssMatrix: Record "Assignment Matrix-X1";
        AssMatrixTemp: Record "Assignment Matrix-X1";
        PayPeriod: Record "Payroll PeriodX1";
        PayStartDate: Date;
        PayPeriodText: Text[30];
        Assm: Record "Assignment Matrix-X1";


    procedure AssistEdit(OldEmployee: Record "HR Employee1"): Boolean
    begin
        with PMEmployee do begin
          PMEmployee := Rec;
          HumanResSetup.Get;
          HumanResSetup.TestField("Employee Nos.");
          if NoSeriesMgt.SelectSeries(HumanResSetup."Employee Nos.",OldEmployee."No. Series","No. Series") then begin
            HumanResSetup.Get;
            HumanResSetup.TestField("Employee Nos.");
            NoSeriesMgt.SetSeries("No.");
            Rec := PMEmployee;
            exit(true);
          end;
        end;
    end;


    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
          exit("Known As" + ' ' + "Last Name")
        else
          exit("Known As" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;


    procedure CurrentPayDetails()
    begin
                if "No." = '' then begin
                /*
                 EmployeePayment.SETFILTER("Employee No.","No.");
                 OK := EmployeePayment.FIND('+');
                  IF OK THEN BEGIN
                     "Pay Period":= EmployeePayment."Pay Period";
                     "Pay Per Period":= EmployeePayment."Pay Per Period";
                     "Contracted Hours":= EmployeePayment."Contracted Hours";
                     "Per Annum":= EmployeePayment."Annual Pay";
                     "Allow Overtime":= EmployeePayment."Allow Overtime";
                      MODIFY;
                  END ELSE BEGIN
                  */
                     "Pay Period":= 4;
                     "Pay Per Period":= 0;
                     "Contracted Hours":= 0;
                     "Per Annum":= 0;
                     "Allow Overtime":= 2;
                      Modify;
                //  END;
                 end;

    end;


    procedure UpdtResUsersetp(var HREmpl: Record "HR Employee1")
    var
        Res: Record Resource;
        Usersetup: Record "User Setup";
    begin
        /*
        ContMgtSetup.GET;
        IF ContMgtSetup."Customer Integration" =
           ContMgtSetup."Customer Integration"::"No Integration"
        THEN
          EXIT;
        */
        /*
        Res.SETCURRENTKEY("No.");
        Res.SETRANGE("No.",HREmpl."Resource No.");
        IF Res.FIND('-') THEN BEGIN
          Res."Global Dimension 1 Code" := HREmpl."Department Code";
          Res."Global Dimension 2 Code" := HREmpl.Office;
          Res.MODIFY;
        END;
        
        IF Usersetup.GET(HREmpl."User ID") THEN BEGIN
          Usersetup.Department := HREmpl."Department Code";
          Usersetup.Office := HREmpl.Office;
          Usersetup.MODIFY;
        END;
        */

    end;


    procedure SetEmployeeHistory()
    var
        "HR Career History": Record "HR Career History1";
    begin
        if not("No." = '') then
        begin
           "HR Career History".Init;
           "HR Career History"."Employee No." := "No.";
           "HR Career History".Validate("Employee No.");
           "HR Career History"."Date Of Event" := "Date Of Join";
           "HR Career History"."Career Event" := 'Joined The Company';
           "HR Career History".Location:= City;
           "HR Career History".Status:= Status;
           "HR Career History".Directorate := "Department Code";
           "HR Career History".Department := Office;
           "HR Career History".Title:= Title;
           "HR Career History".Joined:= true;
           "HR Career History"."Job Title":= Position;
           "HR Career History"."Full/Part Time":= "Full / Part Time";
           "HR Career History"."Marital Status":= "Marital Status";
           "HR Career History"."Vehicle Registration":= "Vehicle Registration Number";
           "HR Career History"."Medical Aid Number":= "Medical Scheme No.";

           if ("HR Career History".Insert) then
              Message(MSG1)
           else
              Error(ERROR1);
        end;
    end;


    procedure GetPayPeriod()
    begin

        PayPeriod.SetRange(PayPeriod."Close Pay",false);
        if PayPeriod.Find('-') then
        PayStartDate:=PayPeriod."Starting Date";
        PayPeriodText:=PayPeriod.Name;
    end;
}

