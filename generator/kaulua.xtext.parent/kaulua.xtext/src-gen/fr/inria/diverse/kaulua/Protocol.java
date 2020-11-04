/**
 * generated by Xtext 2.19.0
 */
package fr.inria.diverse.kaulua;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Protocol</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.inria.diverse.kaulua.Protocol#getName <em>Name</em>}</li>
 *   <li>{@link fr.inria.diverse.kaulua.Protocol#getFeatures <em>Features</em>}</li>
 *   <li>{@link fr.inria.diverse.kaulua.Protocol#getDependencies <em>Dependencies</em>}</li>
 * </ul>
 *
 * @see fr.inria.diverse.kaulua.KauluaPackage#getProtocol()
 * @model
 * @generated
 */
public interface Protocol extends EObject
{
  /**
   * Returns the value of the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the value of the '<em>Name</em>' attribute.
   * @see #setName(String)
   * @see fr.inria.diverse.kaulua.KauluaPackage#getProtocol_Name()
   * @model
   * @generated
   */
  String getName();

  /**
   * Sets the value of the '{@link fr.inria.diverse.kaulua.Protocol#getName <em>Name</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Name</em>' attribute.
   * @see #getName()
   * @generated
   */
  void setName(String value);

  /**
   * Returns the value of the '<em><b>Features</b></em>' containment reference list.
   * The list contents are of type {@link fr.inria.diverse.kaulua.Feature}.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the value of the '<em>Features</em>' containment reference list.
   * @see fr.inria.diverse.kaulua.KauluaPackage#getProtocol_Features()
   * @model containment="true"
   * @generated
   */
  EList<Feature> getFeatures();

  /**
   * Returns the value of the '<em><b>Dependencies</b></em>' containment reference list.
   * The list contents are of type {@link fr.inria.diverse.kaulua.Dependency}.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the value of the '<em>Dependencies</em>' containment reference list.
   * @see fr.inria.diverse.kaulua.KauluaPackage#getProtocol_Dependencies()
   * @model containment="true"
   * @generated
   */
  EList<Dependency> getDependencies();

} // Protocol