require 'spec_helper'

describe 'yum-ius::default' do
  context 'yum-ius::default uses default attributes' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.normal['yum']['ius']['managed'] = true
        node.normal['yum']['ius-debuginfo']['managed'] = true
        node.normal['yum']['ius-source']['managed'] = true
        node.normal['yum']['ius-archive']['managed'] = true
        node.normal['yum']['ius-archive-debuginfo']['managed'] = true
        node.normal['yum']['ius-archive-source']['managed'] = true
        node.normal['yum']['ius-testing']['managed'] = true
        node.normal['yum']['ius-testing-debuginfo']['managed'] = true
        node.normal['yum']['ius-testing-source']['managed'] = true
        node.normal['yum']['ius-dev']['managed'] = true
        node.normal['yum']['ius-dev-debuginfo']['managed'] = true
        node.normal['yum']['ius-dev-source']['managed'] = true
      end.converge(described_recipe)
    end

    %w(
      ius
      ius-debuginfo
      ius-source
      ius-archive
      ius-archive-debuginfo
      ius-archive-source
      ius-testing
      ius-testing-debuginfo
      ius-testing-source
      ius-dev
      ius-dev-debuginfo
      ius-dev-source
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo)
      end
    end
  end

  context 'yum-ius::default uses Redhat distro for RHEL6' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'redhat', version: '6.5') do |node|
        node.normal['yum']['ius']['managed'] = true
        node.normal['yum']['ius-debuginfo']['managed'] = true
        node.normal['yum']['ius-source']['managed'] = true
        node.normal['yum']['ius-archive']['managed'] = true
        node.normal['yum']['ius-archive-debuginfo']['managed'] = true
        node.normal['yum']['ius-archive-source']['managed'] = true
        node.normal['yum']['ius-testing']['managed'] = true
        node.normal['yum']['ius-testing-debuginfo']['managed'] = true
        node.normal['yum']['ius-testing-source']['managed'] = true
        node.normal['yum']['ius-dev']['managed'] = true
        node.normal['yum']['ius-dev-debuginfo']['managed'] = true
        node.normal['yum']['ius-dev-source']['managed'] = true
      end.converge(described_recipe)
    end

    %w(
      ius
      ius-debuginfo
      ius-source
      ius-archive
      ius-archive-debuginfo
      ius-archive-source
      ius-testing
      ius-testing-debuginfo
      ius-testing-source
      ius-dev
      ius-dev-debuginfo
      ius-dev-source
    ).each do |repo|
      it "creates yum_repository[#{repo}] with Redhat repo used in mirrorlist" do
        mirror_repo = repo.sub('ius', 'ius-el$releasever')
        expect(chef_run).to create_yum_repository(repo).with(
          mirrorlist: "https://mirrors.iuscommunity.org/mirrorlist/?repo=#{mirror_repo}&arch=$basearch&protocol=http"
        )
      end
    end
  end

  context 'yum-ius::default uses CentOS distro for CentOS6' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5') do |node|
        node.normal['yum']['ius']['managed'] = true
        node.normal['yum']['ius-debuginfo']['managed'] = true
        node.normal['yum']['ius-source']['managed'] = true
        node.normal['yum']['ius-archive']['managed'] = true
        node.normal['yum']['ius-archive-debuginfo']['managed'] = true
        node.normal['yum']['ius-archive-source']['managed'] = true
        node.normal['yum']['ius-testing']['managed'] = true
        node.normal['yum']['ius-testing-debuginfo']['managed'] = true
        node.normal['yum']['ius-testing-source']['managed'] = true
        node.normal['yum']['ius-dev']['managed'] = true
        node.normal['yum']['ius-dev-debuginfo']['managed'] = true
        node.normal['yum']['ius-dev-source']['managed'] = true
      end.converge(described_recipe)
    end

    %w(
      ius
      ius-debuginfo
      ius-source
      ius-archive
      ius-archive-debuginfo
      ius-archive-source
      ius-testing
      ius-testing-debuginfo
      ius-testing-source
      ius-dev
      ius-dev-debuginfo
      ius-dev-source
    ).each do |repo|
      it "creates yum_repository[#{repo}] with CentOS repo used in mirrorlist" do
        mirror_repo = repo.sub('ius', 'ius-centos$releasever')
        expect(chef_run).to create_yum_repository(repo).with(
          mirrorlist: "https://mirrors.iuscommunity.org/mirrorlist/?repo=#{mirror_repo}&arch=$basearch&protocol=http"
        )
      end
    end
  end
end
