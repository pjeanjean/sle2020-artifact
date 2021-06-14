package kaulua.helper;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.apache.maven.model.Dependency;
import org.apache.maven.model.Plugin;
import org.apache.maven.model.PluginExecution;
import org.apache.maven.plugin.lifecycle.Execution;
import org.codehaus.plexus.util.xml.Xpp3Dom;
import org.eclipse.core.resources.IProject;
import org.eclipse.core.resources.ResourcesPlugin;
import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.NullProgressMonitor;
import org.eclipse.emf.common.util.URI;
import org.eclipse.m2e.core.MavenPlugin;
import org.eclipse.m2e.core.embedder.MavenModelManager;
import org.eclipse.m2e.core.internal.embedder.MavenImpl;
import org.eclipse.m2e.core.internal.preferences.MavenConfigurationImpl;
import org.eclipse.m2e.core.project.LocalProjectScanner;
import org.eclipse.m2e.core.project.MavenProjectInfo;
import org.eclipse.m2e.core.project.ProjectImportConfiguration;
import org.eclipse.m2e.core.ui.internal.wizards.ImportMavenProjectsJob;
import org.eclipse.ui.IWorkingSet;

public class MavenHelper {
	
	public static void addDependency(String projectName, String groupId, String artifactId, String version, String location) {
//		File root = new java.io.File(location);
		java.io.File root = ResourcesPlugin.getWorkspace().getRoot().getLocation().toFile();
		MavenModelManager modelManager = MavenPlugin.getMavenModelManager();
//		String location = root.toString();
		boolean basedirRemameRequired = false;
		LocalProjectScanner projectScanner = new LocalProjectScanner(root, location, basedirRemameRequired,
				modelManager);
		try {
			projectScanner.run(new NullProgressMonitor());
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		List<MavenProjectInfo> mavenProjects = projectScanner.getProjects();
		Optional<MavenProjectInfo> project = mavenProjects.stream()
				.filter(prj -> projectName.equals(prj.getModel().getArtifactId())).findFirst();

		if (project.isPresent()) {
			Dependency dependency = new Dependency();
			dependency.setGroupId(groupId);
			dependency.setArtifactId(artifactId);
			dependency.setVersion(version);
			project.get().getModel().addDependency(dependency);

			MavenImpl maven = new MavenImpl(new MavenConfigurationImpl());
			FileOutputStream out;
			try {
				out = new FileOutputStream(project.get().getPomFile());
				maven.writeModel(project.get().getModel(), out);
			} catch (FileNotFoundException | CoreException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void addDependency(String projectName, String groupId, String artifactId, String version, String location, String scope, String systemPath) {
//		File root = new java.io.File(location);
		java.io.File root = ResourcesPlugin.getWorkspace().getRoot().getLocation().toFile();
		MavenModelManager modelManager = MavenPlugin.getMavenModelManager();
//		String location = root.toString();
		boolean basedirRemameRequired = false;
		LocalProjectScanner projectScanner = new LocalProjectScanner(root, location, basedirRemameRequired,
				modelManager);
		try {
			projectScanner.run(new NullProgressMonitor());
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		List<MavenProjectInfo> mavenProjects = projectScanner.getProjects();
		Optional<MavenProjectInfo> project = mavenProjects.stream()
				.filter(prj -> projectName.equals(prj.getModel().getArtifactId())).findFirst();

		if (project.isPresent()) {
			Dependency dependency = new Dependency();
			dependency.setGroupId(groupId);
			dependency.setArtifactId(artifactId);
			dependency.setVersion(version);
			dependency.setScope(scope);
			dependency.setSystemPath(systemPath);
			project.get().getModel().addDependency(dependency);

			MavenImpl maven = new MavenImpl(new MavenConfigurationImpl());
			FileOutputStream out;
			try {
				out = new FileOutputStream(project.get().getPomFile());
				maven.writeModel(project.get().getModel(), out);
			} catch (FileNotFoundException | CoreException e) {
				e.printStackTrace();
			}
		}
	}
	
	/*
	 * Find the Maven project containing fileUri and add it as dependency to projectName
	 */
	public static void addDependency(String projectName, String fileUri, String location) {
		Optional<MavenProjectInfo> xtextProject = getMavenInfo(fileUri);
		if(xtextProject.isPresent()) {
			MavenProjectInfo info = xtextProject.get();
			String groupId = info.getModel().getGroupId();
			String artifactId = info.getModel().getArtifactId();
			String version = info.getModel().getVersion();
			
			if(groupId == null) {
				groupId = info.getModel().getParent().getGroupId();
			}
			
			if(version == null) {
				version = info.getModel().getParent().getVersion();
			}
			
			MavenHelper.addDependency(projectName, groupId, artifactId, version, location);
		}
	}

	protected static Optional<MavenProjectInfo> getMavenInfo(String ecoreUri) {

		String projectName = getContainingProject(ecoreUri);
		java.io.File ecoreProject = ResourcesPlugin.getWorkspace().getRoot().getProject(projectName).getLocation().toFile();

		java.io.File root = ResourcesPlugin.getWorkspace().getRoot().getLocation().toFile();
		MavenModelManager modelManager = MavenPlugin.getMavenModelManager();
		String location = ecoreProject.toString();
//		String location = root.toString();
		boolean basedirRemameRequired = false;
		LocalProjectScanner projectScanner = new LocalProjectScanner(root, location, basedirRemameRequired,
				modelManager);
		try {
			projectScanner.run(new NullProgressMonitor());
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		List<MavenProjectInfo> mavenProjects = projectScanner.getProjects();
		Optional<MavenProjectInfo> project = mavenProjects.stream().filter(prj -> isPomInside(prj, projectName))
				.findFirst();
		return project;
	}

	protected static String getContainingProject(String ecoreUri) {
		URI uri = URI.createURI(ecoreUri);
		String project = uri.segment(1);
		return project;
	}

	protected static boolean isPomInside(MavenProjectInfo mavenProject, String eclipseProjectName) {

		IProject eclipseProject = ResourcesPlugin.getWorkspace().getRoot().getProject(eclipseProjectName);
		String projectPath = eclipseProject.getLocation().toFile().getAbsolutePath();
		String pomPath = mavenProject.getPomFile().getAbsolutePath();

		boolean isInside = pomPath.startsWith(projectPath);
		return isInside;
	}
	
	public static void importProject(String projectName, String location) {
		
//		File root = new java.io.File(location);
		java.io.File root = ResourcesPlugin.getWorkspace().getRoot().getLocation().toFile();
//		String location = root.toString();
		MavenModelManager modelManager = MavenPlugin.getMavenModelManager();
		boolean basedirRemameRequired = false;
		LocalProjectScanner projectScanner =  new LocalProjectScanner(root, location, basedirRemameRequired, modelManager);
		try {
			projectScanner.run(new NullProgressMonitor());
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		List<MavenProjectInfo> mavenProjects = projectScanner.getProjects();
		List<MavenProjectInfo> projects = 
				mavenProjects
				.stream()
				.filter(prj -> projectName.equals(prj.getModel().getArtifactId()))
				.collect(Collectors.toList());
		List<IWorkingSet> workingSets = new LinkedList<>();
		
		ProjectImportConfiguration importConfig = new ProjectImportConfiguration();
		ImportMavenProjectsJob job = new ImportMavenProjectsJob(projects, workingSets, importConfig);
	    job.setRule(MavenPlugin.getProjectConfigurationManager().getRule());
	    job.schedule();
	}
	
	public static void addSrcGen(String projectName, String location) {
		java.io.File root = ResourcesPlugin.getWorkspace().getRoot().getLocation().toFile();
		MavenModelManager modelManager = MavenPlugin.getMavenModelManager();
		boolean basedirRemameRequired = false;
		LocalProjectScanner projectScanner = new LocalProjectScanner(root, location, basedirRemameRequired,
				modelManager);
		try {
			projectScanner.run(new NullProgressMonitor());
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		List<MavenProjectInfo> mavenProjects = projectScanner.getProjects();
		Optional<MavenProjectInfo> project = mavenProjects.stream()
				.filter(prj -> projectName.equals(prj.getModel().getArtifactId())).findFirst();

		if (project.isPresent()) {
			Plugin srcGenPlugin = new Plugin();
			srcGenPlugin.setGroupId("org.codehaus.mojo");
			srcGenPlugin.setArtifactId("build-helper-maven-plugin");
			srcGenPlugin.setVersion("3.0.0");
			PluginExecution execution = new PluginExecution();
			execution.setPhase("generate-sources");
			execution.addGoal("add-source");
			Xpp3Dom configuration = new Xpp3Dom("configuration");
			Xpp3Dom sources = new Xpp3Dom("sources");
			Xpp3Dom source = new Xpp3Dom("source");
			source.setValue("src-gen");
			sources.addChild(source);
			configuration.addChild(sources);
			execution.setConfiguration(configuration);
			srcGenPlugin.addExecution(execution);
			project.get().getModel().getBuild().addPlugin(srcGenPlugin);

			MavenImpl maven = new MavenImpl(new MavenConfigurationImpl());
			FileOutputStream out;
			try {
				out = new FileOutputStream(project.get().getPomFile());
				maven.writeModel(project.get().getModel(), out);
			} catch (FileNotFoundException | CoreException e) {
				e.printStackTrace();
			}
		}
	}
}
